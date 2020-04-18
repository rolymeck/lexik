create sequence hibernate_sequence start 1 increment 1;

create table message (
    id int8 not null,
    filename varchar(255),
    tag varchar(255),
    text varchar(2048) not null,
    user_id int8,
    primary key (id)
);

create table user_role (
    user_id int8 not null,
    roles varchar(255)
);

create table usr (
    id int8 not null,
    activation_code varchar(255),
    active boolean not null,
    email varchar(128),
    first_name varchar(64),
    last_name varchar(128),
    password varchar(255) not null,
    username varchar(32) not null,
    primary key (id));

alter table if exists usr
    add constraint uk_usr$email
    unique (email);

alter table if exists usr
    add constraint uk_usr$username
    unique (username);

alter table if exists message
    add constraint fk_usr$id__message$user_id
    foreign key (user_id) references usr;

alter table if exists user_role
    add constraint fk_usr$id__user_role$user_id
    foreign key (user_id) references usr;