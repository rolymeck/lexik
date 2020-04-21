create table message_likes
(
    user_id    bigint not null references usr,
    message_id bigint not null references message,
    constraint pk_message_likes$user_id$message_id primary key (user_id, message_id)
);