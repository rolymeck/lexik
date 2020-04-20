create table user_subscriptions
(
    channel_id    int8 not null references usr,
    subscriber_id int8 not null references usr,
    constraint pk_user_subscriptions$channel_id$subscriber_id primary key (channel_id, subscriber_id)
);