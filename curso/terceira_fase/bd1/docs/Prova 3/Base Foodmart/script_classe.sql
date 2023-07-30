--
-- PostgreSQL database dump
--

-- Started on 2009-05-09 15:35:11 BRT

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 1751 (class 0 OID 16440)
-- Dependencies: 1476
-- Data for Name: classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (1, 'Nuts', 'Specialty', 'Produce', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (2, 'Shellfish', 'Seafood', 'Seafood', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (3, 'Canned Fruit', 'Fruit', 'Canned Products', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (4, 'Spices', 'Baking Goods', 'Baking Goods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (5, 'Pasta', 'Starchy Foods', 'Starchy Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (6, 'Yogurt', 'Dairy', 'Dairy', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (7, 'Coffee', 'Dry Goods', 'Baking Goods', 'Drink');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (8, 'Deli Meats', 'Meat', 'Deli', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (9, 'Ice Cream', 'Frozen Desserts', 'Frozen Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (10, 'TV Dinner', 'Frozen Entrees', 'Frozen Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (11, 'Cheese', 'Dairy', 'Dairy', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (12, 'Chips', 'Snack Foods', 'Snack Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (13, 'Fresh Vegetables', 'Vegetables', 'Produce', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (14, 'Sour Cream', 'Dairy', 'Dairy', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (15, 'Cottage Cheese', 'Dairy', 'Dairy', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (16, 'Deli Salads', 'Side Dishes', 'Deli', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (17, 'Dried Meat', 'Snack Foods', 'Snack Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (18, 'Paper Wipes', 'Paper Products', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (19, 'Soda', 'Carbonated Beverages', 'Beverages', 'Drink');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (20, 'Deodorizers', 'Cleaning Supplies', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (21, 'Cleaners', 'Cleaning Supplies', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (22, 'Cleaners', 'Cleaning Supplies', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (23, 'Shower Soap', 'Cleaning Supplies', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (24, 'Fresh Fish', 'Seafood', 'Seafood', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (25, 'Bagels', 'Bread', 'Baked Goods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (26, 'Muffins', 'Bread', 'Baked Goods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (27, 'Sliced Bread', 'Bread', 'Baked Goods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (28, 'Pancake Mix', 'Breakfast Foods', 'Frozen Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (29, 'Pancakes', 'Breakfast Foods', 'Frozen Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (30, 'Juice', 'Pure Juice Beverages', 'Beverages', 'Drink');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (31, 'Jelly', 'Jams and Jellies', 'Baking Goods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (32, 'Jam', 'Jams and Jellies', 'Baking Goods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (33, 'Preserves', 'Jams and Jellies', 'Baking Goods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (34, 'Waffles', 'Breakfast Foods', 'Frozen Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (35, 'Cereal', 'Breakfast Foods', 'Breakfast Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (36, 'Chocolate Candy', 'Candy', 'Snacks', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (37, 'Gum', 'Candy', 'Snacks', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (38, 'Hard Candy', 'Candy', 'Snacks', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (39, 'Personal Hygiene', 'Hygiene', 'Health and Hygiene', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (40, 'Pots and Pans', 'Kitchen Products', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (41, 'Tools', 'Hardware', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (42, 'Sponges', 'Kitchen Products', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (43, 'Beer', 'Beer and Wine', 'Alcoholic Beverages', 'Drink');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (44, 'Wine', 'Beer and Wine', 'Alcoholic Beverages', 'Drink');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (45, 'Cookies', 'Snack Foods', 'Snack Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (46, 'Pretzels', 'Snack Foods', 'Snack Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (47, 'Candles', 'Candles', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (48, 'Sauces', 'Baking Goods', 'Baking Goods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (49, 'Cooking Oil', 'Baking Goods', 'Baking Goods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (50, 'Sugar', 'Baking Goods', 'Baking Goods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (51, 'Chocolate', 'Hot Beverages', 'Beverages', 'Drink');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (52, 'Flavored Drinks', 'Drinks', 'Beverages', 'Drink');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (53, 'Peanut Butter', 'Jams and Jellies', 'Baking Goods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (54, 'Popcorn', 'Snack Foods', 'Snack Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (55, 'Paper Dishes', 'Paper Products', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (56, 'Plastic Utensils', 'Plastic Products', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (57, 'Rice', 'Starchy Foods', 'Starchy Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (58, 'Soup', 'Canned Soup', 'Canned Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (59, 'Dehydrated Soup', 'Packaged Soup', 'Packaged Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (60, 'Frozen Vegetables', 'Vegetables', 'Frozen Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (61, 'Fresh Vegetables', 'Vegetables', 'Produce', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (62, 'Canned Vegetables', 'Vegetables', 'Canned Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (63, 'French Fries', 'Vegetables', 'Frozen Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (64, 'Pizza', 'Pizza', 'Frozen Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (65, 'Hamburger', 'Meat', 'Meat', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (66, 'Eggs', 'Eggs', 'Eggs', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (67, 'Tofu', 'Packaged Vegetables', 'Produce', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (68, 'Dish Soap', 'Bathroom Products', 'Health and Hygiene', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (69, 'Dishwasher Soap', 'Bathroom Products', 'Health and Hygiene', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (70, 'Aspirin', 'Pain Relievers', 'Health and Hygiene', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (71, 'Ibuprofen', 'Pain Relievers', 'Health and Hygiene', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (72, 'Acetominifen', 'Pain Relievers', 'Health and Hygiene', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (73, 'Nasal Sprays', 'Decongestants', 'Health and Hygiene', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (74, 'Mouthwash', 'Bathroom Products', 'Health and Hygiene', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (75, 'Cold Remedies', 'Cold Remedies', 'Health and Hygiene', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (76, 'Milk', 'Dairy', 'Dairy', 'Drink');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (77, 'Fresh Chicken', 'Meat', 'Deli', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (78, 'Conditioner', 'Bathroom Products', 'Health and Hygiene', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (79, 'Shampoo', 'Bathroom Products', 'Health and Hygiene', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (80, 'Lightbulbs', 'Electrical', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (81, 'Hot Dogs', 'Meat', 'Deli', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (82, 'Crackers', 'Snack Foods', 'Snack Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (83, 'Dips', 'Snack Foods', 'Snack Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (84, 'Donuts', 'Snack Foods', 'Snack Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (85, 'Toilet Brushes', 'Bathroom Products', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (86, 'Pot Scrubbers', 'Kitchen Products', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (87, 'Pot Cleaners', 'Kitchen Products', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (88, 'Toothbrushes', 'Bathroom Products', 'Health and Hygiene', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (89, 'Sunglasses', 'Specialty', 'Carousel', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (90, 'Coffee', 'Hot Beverages', 'Beverages', 'Drink');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (91, 'Bologna', 'Meat', 'Deli', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (92, 'Non-Alcoholic Wine', 'Beer and Wine', 'Alcoholic Beverages', 'Drink');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (93, 'Tuna', 'Canned Tuna', 'Canned Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (94, 'Shrimp', 'Canned Shrimp', 'Canned Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (95, 'Anchovies', 'Canned Anchovies', 'Canned Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (96, 'Clams', 'Canned Clams', 'Canned Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (97, 'Oysters', 'Canned Oysters', 'Canned Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (98, 'Sardines', 'Canned Sardines', 'Canned Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (99, 'Fresh Fruit', 'Fruit', 'Produce', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (100, 'Frozen Chicken', 'Meat', 'Frozen Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (101, 'Batteries', 'Electrical', 'Household', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (102, 'Maps', 'Miscellaneous', 'Checkout', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (103, 'Screwdrivers', 'Hardware', 'Checkout', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (104, 'Sports Magazines', 'Magazines', 'Periodicals', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (105, 'Home Magazines', 'Magazines', 'Periodicals', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (106, 'Fashion Magazines', 'Magazines', 'Periodicals', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (107, 'Computer Magazines', 'Magazines', 'Periodicals', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (108, 'Auto Magazines', 'Magazines', 'Periodicals', 'Non-Consumable');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (109, 'Dried Fruit', 'Snack Foods', 'Snack Foods', 'Food');
INSERT INTO classe (codigo, subcategoria, categoria, departamento, familia) VALUES (110, 'Popsicles', 'Frozen Desserts', 'Frozen Foods', 'Food');


-- Completed on 2009-05-09 15:35:11 BRT

--
-- PostgreSQL database dump complete
--

