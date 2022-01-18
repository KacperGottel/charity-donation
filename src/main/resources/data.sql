INSERT INTO `charity-donation`.category (id, name) VALUES (1, 'ubrania');
INSERT INTO `charity-donation`.category (id, name) VALUES (2, 'zabawki');
INSERT INTO `charity-donation`.category (id, name) VALUES (3, 'elektronika');
INSERT INTO `charity-donation`.category (id, name) VALUES (4, 'sprzęt medyczny');
INSERT INTO `charity-donation`.category (id, name) VALUES (5, 'książki');

INSERT INTO `charity-donation`.institution (id, description, name) VALUES (1, 'Pomoc dzieciom z ubogich rodzin.', 'Dbam o Zdrowie');
INSERT INTO `charity-donation`.institution (id, description, name) VALUES (2, 'Pomoc osobom znajdującym się w trudnej sytuacji życiowej.', 'Dla dzieci');
INSERT INTO `charity-donation`.institution (id, description, name) VALUES (3, 'Pomoc wybudzaniu dzieci ze śpiączki.', 'A kogo');
INSERT INTO `charity-donation`.institution (id, description, name) VALUES (4, 'Pomoc dla osób nie posiadających miejsca zamieszkania', 'Bez domu');

INSERT INTO `charity-donation`.donation (id, city, pick_up_comment, pick_up_date, pick_up_time, quantity, street, zip_code, institution_id, user_id) VALUES (1, 'Jaworzno', 'be careful', '2022-01-15', '15:30', 5, 'Jatka', '123', 1, 1);
INSERT INTO `charity-donation`.donation (id, city, pick_up_comment, pick_up_date, pick_up_time, quantity, street, zip_code, institution_id, user_id) VALUES (2, 'Java', 'warning! glass', '2022-01-15', '15:30', 10, 'Japka', '456', 2, 2);
INSERT INTO `charity-donation`.donation (id, city, pick_up_comment, pick_up_date, pick_up_time, quantity, street, zip_code, institution_id, user_id) VALUES (3, 'Jakarta', 'cannot get wet', '2022-01-15', '15:30', 15, 'Jarka', '789', 3, 1);
INSERT INTO `charity-donation`.donation (id, city, pick_up_comment, pick_up_date, pick_up_time, quantity, street, zip_code, institution_id, user_id) VALUES (4, 'Juarez', 'thanks!', '2022-01-15', '15:30:18', 20, 'Janka', '777', 4, 2);
INSERT INTO `charity-donation`.donation (id, city, pick_up_comment, pick_up_date, pick_up_time, quantity, street, zip_code, institution_id, user_id) VALUES (5, 'dsfgsdf', 'sfgsdfg', '2022-01-11', '12:20:00', 2, 'dfgfdg', '7', 3, 1);

INSERT INTO `charity-donation`.donation_categories (donation_id, categories_id) VALUES (5, 5);
INSERT INTO `charity-donation`.donation_categories (donation_id, categories_id) VALUES (4, 4);
INSERT INTO `charity-donation`.donation_categories (donation_id, categories_id) VALUES (3, 3);
INSERT INTO `charity-donation`.donation_categories (donation_id, categories_id) VALUES (2, 2);
INSERT INTO `charity-donation`.donation_categories (donation_id, categories_id) VALUES (1, 1);

INSERT INTO `charity-donation`.role (id, name) VALUES (1, 'ROLE_USER');
INSERT INTO `charity-donation`.role (id, name) VALUES (2, 'ROLE_ADMIN');

INSERT INTO `charity-donation`.user (id, username, email, password, enabled, role_id) VALUES (1, 'user', 'u@u.pl', '$2a$12$rVS3Ri0CasOvpnk1UBrKR.caYHqLZ3drQdH4./oy4YAb6/A7J3MYS', true, 1);

create table persistent_logins
(
    username  varchar(64) not null,
    series    varchar(64) not null
        primary key,
    token     varchar(64) not null,
    last_used timestamp   not null
);

INSERT INTO `charity-donation`.status (id, delivery_date, is_delivered, is_picked_up, donation_id) VALUES (1, '2022-01-16', true, true, 1);
INSERT INTO `charity-donation`.status (id, delivery_date, is_delivered, is_picked_up, donation_id) VALUES (2, '2022-01-16', true, true, 2);
INSERT INTO `charity-donation`.status (id, delivery_date, is_delivered, is_picked_up, donation_id) VALUES (3, '2022-01-16', true, true, 3);
INSERT INTO `charity-donation`.status (id, delivery_date, is_delivered, is_picked_up, donation_id) VALUES (4, '2022-01-16', false, false, 4);
INSERT INTO `charity-donation`.status (id, delivery_date, is_delivered, is_picked_up, donation_id) VALUES (5, '2022-01-16', false, true, 5);
