package me.lexik.webapp.controller;

import me.lexik.webapp.domain.Message;
import me.lexik.webapp.domain.User;
import me.lexik.webapp.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {
    @Value("${upload.path}")
    String uploadPath;
    @Autowired
    private MessageRepository messageRepository;

    @GetMapping
    public String home(Map<String, Object> model) {
        return "home";
    }

    @GetMapping("main")
    public String main(@RequestParam(required = false) String filter, Model model) {
        Iterable<Message> messages;

        if (filter != null && !filter.isEmpty()) {
            messages = messageRepository.findByTag(filter);
            model.addAttribute("filter", filter);
        } else {
            messages = messageRepository.findAll();
        }
        model.addAttribute("messages", messages);
        return "main";
    }

    @PostMapping("main")
    public String add(@AuthenticationPrincipal User user,
                      @Valid Message message,
                      BindingResult bindingResult,
                      @RequestParam("file") MultipartFile file,
                      Model model) throws IOException {

        message.setAuthor(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);

        } else {
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

            model.addAttribute("message", null);
            messageRepository.save(message);
        }

        Iterable<Message> messages = messageRepository.findAll();
        model.addAttribute("messages", messages);
        return "main";
    }
}
