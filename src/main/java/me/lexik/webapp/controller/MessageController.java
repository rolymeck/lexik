package me.lexik.webapp.controller;

import me.lexik.webapp.domain.Message;
import me.lexik.webapp.domain.User;
import me.lexik.webapp.domain.dto.MessageDto;
import me.lexik.webapp.repository.MessageRepository;
import me.lexik.webapp.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Controller
public class MessageController {

    @Value("${upload.path}")
    String uploadPath;

    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private MessageService messageService;

    @GetMapping("/")
    public String home(Map<String, Object> model, HttpSession s) {
        return "home";
    }

    @GetMapping("/main")
    public String main(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model,
            @AuthenticationPrincipal User user
    ) {
        List<MessageDto> messages = messageService.messageList(filter, user);

        model.addAttribute("messages", messages);
        model.addAttribute("url", "/main");
        model.addAttribute("filter", filter);
        model.addAttribute("pricipalId", user.getId());
        return "main";
    }

    @PostMapping("/main")
    public String add(@AuthenticationPrincipal User user,
                      @Valid Message message,
                      BindingResult bindingResult,
                      Model model,
                      @RequestParam("file") MultipartFile file
    ) throws IOException {

        message.setAuthor(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);

        } else {
            saveFile(message, file);

            model.addAttribute("message", null);
            messageRepository.save(message);
        }

        Iterable<Message> messages = messageRepository.findAll();
        model.addAttribute("messages", messages);
        return "redirect:/main";
    }

    @GetMapping("/user-messages/{author}")
    public String userMessages(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User author,
            Model model,
            @RequestParam(required = false) Message message
    ) {
        List<MessageDto> messages = messageService.messageListForUser(currentUser, author);

        model.addAttribute("isCurrentUser", currentUser.equals(author));
        model.addAttribute("userChannel", author);
        model.addAttribute("messages", messages);
        model.addAttribute("message", message);
        model.addAttribute("isSubscriber", author.getSubscribers().contains(currentUser));
        model.addAttribute("subscriptionsCount", author.getSubscriptions().size());
        model.addAttribute("subscribersCount", author.getSubscribers().size());
        model.addAttribute("url", "/user-messages/" + author.getId());

        return "userMessages";
    }

    @PostMapping("user-messages/{user}")
    public String updateMessage(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long user,
            @RequestParam("id") Message message,
            @RequestParam("text") String text,
            @RequestParam("tag") String tag,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        if (message.getAuthor().equals(currentUser)) {
            if (!StringUtils.isEmpty(text)) {
                message.setText(text);
            }
            if (!StringUtils.isEmpty(tag)) {
                message.setTag(tag);
            }
            saveFile(message, file);
            messageRepository.save(message);
        }

        return "redirect:/user-messages/" + user;
    }

    @GetMapping("/messages/{message}/like")
    public String like(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Message message,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) {
        Set<User> likes = message.getLikes();

        if (likes.contains(currentUser)) {
            likes.remove(currentUser);
        } else {
            likes.add(currentUser);
        }

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .forEach(redirectAttributes::addAttribute);

        return "redirect:" + components.getPath();
    }

    private void saveFile(@Valid Message message, @RequestParam("file") MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            Path uploadDir = Path.of(uploadPath);
            if (!Files.exists(uploadDir)) {
                Files.createDirectory(uploadDir);
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(Path.of(uploadPath + "/" + resultFileName));
            message.setFilename(resultFileName);
        }
    }
}
