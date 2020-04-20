delete
from user_role;
delete
from usr;

insert into usr (id, active, password, username)
values (nextval('seq_usr'), true, '$2a$08$KxdQ85YpoE3ytWXJV3jONuHt8iEU66lYLhmD2cQlRBJaiAMwkdfD6', 'admin'),
       (nextval('seq_usr'), true, '$2a$08$KxdQ85YpoE3ytWXJV3jONuHt8iEU66lYLhmD2cQlRBJaiAMwkdfD6', 'mike');

insert into user_role (user_id, roles)
values (1, 'USER'),
       (1, 'ADMIN'),
       (2, 'USER');