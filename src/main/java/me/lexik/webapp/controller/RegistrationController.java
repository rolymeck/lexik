package me.lexik.webapp.controller;

import me.lexik.webapp.domain.User;
import me.lexik.webapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    UserService userService;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(
            @RequestParam("passwordConfirmation") String passwordConfirmation,
            @Valid User user,
            BindingResult bindingResult,
            Model model) {

        boolean isConfirmationEmpty = StringUtils.isEmpty(passwordConfirmation);

        if (isConfirmationEmpty) {
            model.addAttribute("passwordConfirmationError", "Пароль не должен быть пустым");
        }

        if (user.getPassword() != null && !user.getPassword().equals(passwordConfirmation)) {
            model.addAttribute("passwordError", "Пароли не совпадают");
        }

        if (isConfirmationEmpty || bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "registration";
        }

        if (!userService.addUser(user)) {
            model.addAttribute("userError", "Пользователь с таким именем уже существует!");
            return "registration";
        }

        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {

        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "Учетная запись активирована");
        } else {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Код активации не найден");
        }
        return "login";
    }
}
