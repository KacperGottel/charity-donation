INSERT INTO `charity-donation`.category (id, name) VALUES (1, 'ubrania');
INSERT INTO `charity-donation`.category (id, name) VALUES (2, 'zabawki');
INSERT INTO `charity-donation`.category (id, name) VALUES (3, 'elektronika');
INSERT INTO `charity-donation`.category (id, name) VALUES (4, 'sprzęt medyczny');
INSERT INTO `charity-donation`.category (id, name) VALUES (5, 'książki');

INSERT INTO `charity-donation`.institution (id, description, name) VALUES (1, 'Pomoc dzieciom z ubogich rodzin.', 'Dbam o Zdrowie');
INSERT INTO `charity-donation`.institution (id, description, name) VALUES (2, 'Pomoc osobom znajdującym się w trudnej sytuacji życiowej.', 'Dla dzieci');
INSERT INTO `charity-donation`.institution (id, description, name) VALUES (3, 'Pomoc wybudzaniu dzieci ze śpiączki.', 'A kogo');
INSERT INTO `charity-donation`.institution (id, description, name) VALUES (4, 'Pomoc dla osób nie posiadających miejsca zamieszkania', 'Bez domu');

INSERT INTO `charity-donation`.donation (id, city, pick_up_comment, pick_up_date, pick_up_time, quantity, street, zip_code, institution_id) VALUES (1, 'Jaworzno', 'be careful', '2022-01-15', '15:30:18', 5, 'Jatka', '123', 1);
INSERT INTO `charity-donation`.donation (id, city, pick_up_comment, pick_up_date, pick_up_time, quantity, street, zip_code, institution_id) VALUES (2, 'Java', 'warning! glass', '2022-01-15', '15:30:18', 10, 'Japka', '456', 2);
INSERT INTO `charity-donation`.donation (id, city, pick_up_comment, pick_up_date, pick_up_time, quantity, street, zip_code, institution_id) VALUES (3, 'Jakarta', 'cannot get wet', '2022-01-15', '15:30:18', 15, 'Jarka', '789', 3);
INSERT INTO `charity-donation`.donation (id, city, pick_up_comment, pick_up_date, pick_up_time, quantity, street, zip_code, institution_id) VALUES (4, 'Juarez', 'thanks!', '2022-01-15', '15:30:18', 20, 'Janka', '777', 4);
INSERT INTO `charity-donation`.donation (id, city, pick_up_comment, pick_up_date, pick_up_time, quantity, street, zip_code, institution_id) VALUES (5, 'dsfgsdf', 'sfgsdfg', '2022-01-11', '12:20:00', 2, 'dfgfdg', '7', 3);

INSERT INTO `charity-donation`.donation_categories (donation_id, categories_id) VALUES (5, 1);