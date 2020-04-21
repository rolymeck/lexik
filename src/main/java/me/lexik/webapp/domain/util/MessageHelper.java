package me.lexik.webapp.domain.util;

import me.lexik.webapp.domain.User;

public abstract class MessageHelper {
    public static String getAuthorName(User author) {
        return author != null ? author.getUsername() : "<none>";
    }
}
