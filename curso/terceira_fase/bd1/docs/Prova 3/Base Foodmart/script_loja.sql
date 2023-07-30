--
-- PostgreSQL database dump
--

-- Started on 2009-05-09 16:27:52 BRT

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 1752 (class 0 OID 16461)
-- Dependencies: 1479
-- Data for Name: loja; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (0, 'HeadQuarters', 0, 'HQ', 0, '1 Alameda Way', '55555', NULL, NULL, NULL);
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (1, 'Supermarket', 28, 'Store 1', 1, '2853 Bailey Rd', '55555', 'Jones', '262-555-5124', '262-555-5121');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (2, 'Small Grocery', 78, 'Store 2', 2, '5203 Catanzaro Way', '55555', 'Smith', '605-555-8203', '605-555-8201');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (3, 'Supermarket', 76, 'Store 3', 3, '1501 Ramsey Circle', '55555', 'Davis', '509-555-1596', '509-555-1591');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (4, 'Gourmet Supermarket', 27, 'Store 4', 4, '433 St George Dr', '55555', 'Johnson', '304-555-1474', '304-555-1471');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (5, 'Small Grocery', 4, 'Store 5', 5, '1250 Coggins Drive', '55555', 'Green', '801-555-4324', '801-555-4321');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (6, 'Gourmet Supermarket', 47, 'Store 6', 6, '5495 Mitchell Canyon Road', '55555', 'Maris', '958-555-5002', '958-555-5001');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (7, 'Supermarket', 3, 'Store 7', 7, '1077 Wharf Drive', '55555', 'White', '477-555-7967', '477-555-7961');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (8, 'Deluxe Supermarket', 26, 'Store 8', 8, '3173 Buena Vista Ave', '55555', 'Williams', '797-555-3417', '797-555-3411');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (9, 'Mid-Size Grocery', 2, 'Store 9', 9, '1872 El Pintado Road', '55555', 'Stuber', '439-555-3524', '439-555-3521');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (10, 'Supermarket', 24, 'Store 10', 10, '7894 Rotherham Dr', '55555', 'Merz', '212-555-4774', '212-555-4771');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (11, 'Supermarket', 22, 'Store 11', 11, '5371 Holland Circle', '55555', 'Erickson', '685-555-8995', '685-555-8991');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (12, 'Deluxe Supermarket', 25, 'Store 12', 12, '1120 Westchester Pl', '55555', 'Kalman', '151-555-1702', '151-555-1701');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (13, 'Deluxe Supermarket', 23, 'Store 13', 13, '5179 Valley Ave', '55555', 'Inmon', '977-555-2724', '977-555-2721');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (14, 'Small Grocery', 1, 'Store 14', 14, '4365 Indigo Ct', '55555', 'Strehlo', '135-555-4888', '135-555-4881');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (15, 'Supermarket', 18, 'Store 15', 15, '5006 Highland Drive', '55555', 'Ollom', '893-555-1024', '893-555-1021');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (16, 'Supermarket', 87, 'Store 16', 16, '5922 La Salle Ct', '55555', 'Mantle', '643-555-3645', '643-555-3641');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (17, 'Deluxe Supermarket', 84, 'Store 17', 17, '490 Risdon Road', '55555', 'Mays', '855-555-5581', '855-555-5581');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (18, 'Mid-Size Grocery', 25, 'Store 18', 18, '6764 Glen Road', '55555', 'Brown', '528-555-8317', '528-555-8311');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (19, 'Deluxe Supermarket', 5, 'Store 19', 19, '6644 Sudance Drive', '55555', 'Ruth', '862-555-7395', '862-555-7391');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (20, 'Mid-Size Grocery', 6, 'Store 20', 20, '3706 Marvelle Ln', '55555', 'Cobb', '897-555-1931', '897-555-1931');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (21, 'Deluxe Supermarket', 106, 'Store 21', 21, '4093 Steven Circle', '55555', 'Jones', '493-555-4781', '493-555-4781');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (22, 'Small Grocery', 88, 'Store 22', 22, '9606 Julpum Loop', '55555', 'Byrg', '881-555-5117', '881-555-5111');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (23, 'Mid-Size Grocery', 89, 'Store 23', 23, '3920 Noah Court', '55555', 'Johnson', '170-555-8424', '170-555-8421');
INSERT INTO loja (codigo, tipo, regiao_codigo, nome, numero, endereco, cep, gerente, fone, fax) VALUES (24, 'Supermarket', 7, 'Store 24', 24, '2342 Waltham St.', '55555', 'Byrd', '111-555-0303', '111-555-0304');


-- Completed on 2009-05-09 16:27:52 BRT

--
-- PostgreSQL database dump complete
--

