use shop;

insert into Users (customerId, username, password, enabled) values ('1', 'admin','admin', true);

insert into Authorities (authority, username) values ('ROLE_ADMIN','admin');
