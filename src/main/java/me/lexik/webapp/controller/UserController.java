package me.lexik.webapp.controller;

import me.lexik.webapp.domain.Role;
import me.lexik.webapp.domain.User;
import me.lexik.webapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/u")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {

    @Autowired
    UserRepository userRepository;

    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userRepository.findAll());
        return "userList";
    }

    @PostMapping
    public String saveUser(@RequestParam("id") User user,
                           @RequestParam Map<String, String> form,
                           @RequestParam String username) {

        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepository.save(user);

        return "redirect:/u";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        if (user == null) {
            return "main";
        }
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }
}
