package me.lexik.webapp.service;

import me.lexik.webapp.domain.User;
import me.lexik.webapp.domain.dto.MessageDto;
import me.lexik.webapp.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

    public List<MessageDto> messageList(String filter, User user) {
        if (filter != null && !filter.isEmpty()) {
            return messageRepository.findByTag(filter, user);
        } else {
            return messageRepository.findAll(user);
        }
    }

    public List<MessageDto> messageListForUser(User currentUser, User author) {
        return messageRepository.findByUser(author, currentUser);
    }
}
