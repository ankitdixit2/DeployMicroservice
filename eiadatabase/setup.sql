ALTER USER 'users_service' IDENTIFIED WITH mysql_native_password BY '123';
create table directory (user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, email TEXT, phone_number TEXT);
insert into directory (email, phone_number) values ('sowmya.sivakumar@tcs.com', '+1 888 123 1111');
insert into directory (email, phone_number) values ('shrilekha.s@tcs.com', '+1 888 123 1112');
insert into directory (email, phone_number) values ('sarthak.b@tcs.com', '+1 888 123 1113');
insert into directory (email, phone_number) values ('gurpreet14.s@tcs.com', '+1 888 123 1114');
