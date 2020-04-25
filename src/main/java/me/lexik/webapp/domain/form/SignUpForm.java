package me.lexik.webapp.domain.form;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class SignUpForm {

    @NotNull
    @NotEmpty
    private String username;

    @NotNull
    @NotEmpty
    private String email;

    @NotNull
    @NotEmpty
    private String password;

    @NotNull
    @NotEmpty
    private String matchingPassword;

}
