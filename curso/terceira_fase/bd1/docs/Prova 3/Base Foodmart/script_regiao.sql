--
-- PostgreSQL database dump
--

-- Started on 2009-05-09 15:28:41 BRT

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 1751 (class 0 OID 16455)
-- Dependencies: 1478
-- Data for Name: regiao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (0, 'None', 'None', 'No District', 'No regiao', 'No Country');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (1, 'San Francisco', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (2, 'Mexico City', 'DF', 'Mexico City', 'Mexico Central', 'Mexico');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (3, 'Los Angeles', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (4, 'Guadalajara', 'Jalisco', 'Guadalajara', 'Mexico West', 'Mexico');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (5, 'Vancouver', 'BC', 'Vancouver', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (6, 'Victoria', 'BC', 'Victoria', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (7, 'San Diego', 'CA', 'San Diego', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (8, 'Coronado', 'CA', 'San Diego', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (9, 'National City', 'CA', 'San Diego', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (10, 'Lincoln Acres', 'CA', 'San Diego', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (11, 'La Mesa', 'CA', 'San Diego', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (12, 'Lemon Grove', 'CA', 'San Diego', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (13, 'Chula Vista', 'CA', 'San Diego', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (14, 'Imperial Beach', 'CA', 'San Diego', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (15, 'Spring Valley', 'CA', 'San Diego', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (16, 'El Cajon', 'CA', 'San Diego', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (17, 'Grossmont', 'CA', 'San Diego', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (18, 'Seattle', 'WA', 'Seattle', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (19, 'Redmond', 'WA', 'Seattle', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (20, 'Ballard', 'WA', 'Seattle', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (21, 'Issaquah', 'WA', 'Seattle', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (22, 'Portland', 'OR', 'Portland', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (23, 'Salem', 'OR', 'Salem', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (24, 'Orizaba', 'Veracruz', 'Orizaba', 'Mexico Central', 'Mexico');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (25, 'Hidalgo', 'Zacatecas', 'Hidalgo', 'Mexico Central', 'Mexico');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (26, 'Merida', 'Yucatan', 'Marida', 'Mexico South', 'Mexico');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (27, 'Camacho', 'Zacatecas', 'Camacho', 'Mexico Central', 'Mexico');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (28, 'Acapulco', 'Guerrero', 'Acapulco', 'Mexico West', 'Mexico');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (29, 'La Cruz', 'Sinaloa', 'Acapulco', 'Mexico West', 'Mexico');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (30, 'Tlaxiaco', 'Oaxaca', 'Tlaxiaco', 'Mexico South', 'Mexico');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (31, 'Daly City', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (32, 'Colma', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (33, 'La Jolla', 'CA', 'San Diego', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (34, 'Fremont', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (35, 'Richmond', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (36, 'Berkeley', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (37, 'Oakland', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (38, 'Mill Valley', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (39, 'San Jose', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (40, 'Santa Cruz', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (41, 'Palo Alto', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (42, 'Novato', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (43, 'Burlingame', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (44, 'San Carlos', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (45, 'Redwood City', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (46, 'Concord', 'CA', 'San Francisco', 'Central West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (47, 'Beverly Hills', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (48, 'Long Beach', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (49, 'Santa Monica', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (50, 'Altadena', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (51, 'Arcadia', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (52, 'San Gabriel', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (53, 'Burbank', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (54, 'Glendale', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (55, 'Bellflower', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (56, 'Lakewood', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (57, 'Torrance', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (58, 'Downey', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (59, 'Newport Beach', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (60, 'West Covina', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (61, 'Pomona', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (62, 'Woodland Hills', 'CA', 'Los Angeles', 'South West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (63, 'Kirkland', 'WA', 'Seattle', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (64, 'Lake Oswego', 'OR', 'Portland', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (65, 'Milwaukie', 'OR', 'Portland', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (66, 'W. Linn', 'OR', 'Portland', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (67, 'Beaverton', 'OR', 'Portland', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (68, 'Oregon City', 'OR', 'Portland', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (69, 'Woodburn', 'OR', 'Salem', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (70, 'Corvallis', 'OR', 'Salem', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (71, 'Albany', 'OR', 'Salem', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (72, 'Lebanon', 'OR', 'Salem', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (73, 'Renton', 'WA', 'Seattle', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (74, 'Burien', 'WA', 'Seattle', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (75, 'Lynnwood', 'WA', 'Seattle', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (76, 'Bremerton', 'WA', 'Bremerton', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (77, 'Port Orchard', 'WA', 'Bremerton', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (78, 'Bellingham', 'WA', 'Bellingham', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (79, 'Anacortes', 'WA', 'Bellingham', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (80, 'Sedro Woolley', 'WA', 'Bellingham', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (81, 'Everett', 'WA', 'Seattle', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (82, 'Marysville', 'WA', 'Seattle', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (83, 'Edmonds', 'WA', 'Seattle', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (84, 'Tacoma', 'WA', 'Tacoma', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (85, 'Olympia', 'WA', 'Tacoma', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (86, 'Puyallup', 'WA', 'Tacoma', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (87, 'Spokane', 'WA', 'Spokane', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (88, 'Walla Walla', 'WA', 'Walla Walla', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (89, 'Yakima', 'WA', 'Yakima', 'North West', 'USA');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (90, 'Richmond', 'BC', 'Vancouver', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (91, 'Westminster', 'BC', 'Vancouver', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (92, 'Burnaby', 'BC', 'Vancouver', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (93, 'Haney', 'BC', 'Vancouver', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (94, 'Langley', 'BC', 'Vancouver', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (95, 'Newton', 'BC', 'Vancouver', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (96, 'Ladner', 'BC', 'Vancouver', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (97, 'N. Vancouver', 'BC', 'Vancouver', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (98, 'Port Hammond', 'BC', 'Vancouver', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (99, 'Oak Bay', 'BC', 'Victoria', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (100, 'Royal Oak', 'BC', 'Victoria', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (101, 'Sooke', 'BC', 'Victoria', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (102, 'Langford', 'BC', 'Victoria', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (103, 'Cliffside', 'BC', 'Victoria', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (104, 'Metchosin', 'BC', 'Victoria', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (105, 'Shawnee', 'BC', 'Victoria', 'Canada West', 'Canada');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (106, 'San Andres', 'DF', 'Mexico City', 'Mexico Central', 'Mexico');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (107, 'Tixapan', 'DF', 'Mexico City', 'Mexico Central', 'Mexico');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (108, 'Santa Anita', 'DF', 'Mexico City', 'Mexico Central', 'Mexico');
INSERT INTO regiao (codigo, cidade, estado, distrito, regional, pais) VALUES (109, 'Santa Fe', 'DF', 'Mexico City', 'Mexico Central', 'Mexico');


-- Completed on 2009-05-09 15:28:41 BRT

--
-- PostgreSQL database dump complete
--

