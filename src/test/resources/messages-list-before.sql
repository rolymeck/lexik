delete
from message;

insert into message(id, text, tag, user_id)
values (nextval('seq_message'), 'first', 'my-tag', 1),
       (nextval('seq_message'), 'second', 'more', 1),
       (nextval('seq_message'), 'third', 'my-tag', 1),
       (nextval('seq_message'), 'fourth', 'another', 2);