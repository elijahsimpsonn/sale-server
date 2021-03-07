BEGIN;

TRUNCATE users, platforms, platform_fees, deaditems, shipping_supplies, general_fees, item_location, category, subcategory, item;

INSERT INTO users (user_id, user_name, user_password, user_email, is_admin)
VALUES (1, "demo", "$2y$12$Amv7KoHFNLw.yBgznb/8H.XV2sr7tHqkBV7zydrIlnzKYIQuu2xeG", "demo@demo.com", false);

INSERT INTO platforms (user_id, platform_id, platform_name)
VALUES 
    (1, 1, "Ebay"),
    (1, 2, "Amazon FBA"),
    (1, 3, "StockX");

INSERT INTO platform_fees (user_id, platform_id, fee_type, cost)
VALUES 
    (1, 1, "Pro Seller Membership", 15),
    (1, 1, "Store Membership", 12),
    (1, 2, "Warehouse Space", 6);

INSERT INTO deaditems (user_id, total, date_created, cost)
VALUES (1, 145, ('2021-01-01')::date, 98.67);

INSERT INTO shipping_supplies (user_id, supply_name, supply_type, size)
VALUES 
    (1, "Box", "Box", "Medium"),
    (1, "Box", "Box", "Large"),
    (1, "Bubble Wrap", "Bubble Wrap", "Large"),
    (1, "Cheap Paper", "Paper", "Medium"),
    (1, "Tube", "Box", "5 Feet");

INSERT INTO general_fees (user_id, fee_type, cost)
VALUES 
    (1, "Storage Fee", 149.99);

INSERT INTO item_location (location_id, user_id, location_name, location_area)
VALUES 
    (1, 1, "A1", "Garage"),
    (2, 1, "A2", "Garage"),
    (3, 1, "A3", "Garage"),
    (4, 1, "B1", "Garage"),
    (5, 1, "B1", "Garage"),
    (6, 1, "B1", "Garage"),
    (7, 1, "A1", "Basement"),
    (8, 1, "A2", "Basement"),
    (9, 1, "A3", "Basement"),
    (10, 1, "A4", "Basement");

INSERT INTO category (category_id, user_id, category_name)
VALUES 
    (1, 1, "Books"),
    (2, 1, "Toys"),
    (3, 1, "Video Games");

INSERT INTO subcategory (category_id, user_id, subcategory_id, category_name)
VALUES 
    (1, 1, 1, "Fiction"),
    (1, 1, 2, "Non-Fiction"),
    (2, 1, 3, "Hot Wheels"),
    (2, 1, 4, "Barbie"),
    (3, 1, 5, "Nintendo"),
    (3, 1, 6, "Xbox");

INSERT INTO item (item_id, user_id, platform_id, location_id, category_id, subcategory_id, item_name, date_created, cost, quantity, is_sold)
VALUES 
    (1, 1, 1, 1, 3, 5, "Super Mario Brothers NES Cart Only", ('2021-01-01')::date, 98.67), 2.99, 1, false, );