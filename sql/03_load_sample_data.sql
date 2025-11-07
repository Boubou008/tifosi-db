-- 03_load_sample_data.sql
-- Jeu de données d'exemple 
USE tifosi;

-- Nettoyage doux
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE focaccia_ingredient;
TRUNCATE TABLE boisson;
TRUNCATE TABLE marque;
TRUNCATE TABLE focaccia;
TRUNCATE TABLE ingredient;
SET FOREIGN_KEY_CHECKS = 1;

-- Ingrédients (12 au total, dont 2 seront "inutilisés")
INSERT INTO ingredient (nom) VALUES
 ('Ail'),
 ('Champignons'),
 ('Tomate'),
 ('Mozzarella'),
 ('Roquette'),
 ('Oignon'),
 ('Jambon'),
 ('Pesto'),
 ('Olive'),
 ('Basilic'),
 ('Câpres'),     -- inutilisé
 ('Anchois');    -- inutilisé

-- Focaccias (6)
INSERT INTO focaccia (nom, prix) VALUES
 ('Raclaccia',       9.50),
 ('Margherina',      8.00),
 ('Funghi',          9.00),
 ('Aglio e Olio',    7.50),
 ('Verde',           9.20),
 ('Prosciutto',     10.50);

-- Marques & Boissons (exemple)
INSERT INTO marque (nom) VALUES ('San Pellegrino'), ('Coca-Cola'), ('Pepsi');

INSERT INTO boisson (nom, marque_id)
SELECT 'Limonata', m.id FROM marque m WHERE m.nom='San Pellegrino'
UNION ALL
SELECT 'Aranciata', m.id FROM marque m WHERE m.nom='San Pellegrino'
UNION ALL
SELECT 'Coca-Cola', m.id  FROM marque m WHERE m.nom='Coca-Cola'
UNION ALL
SELECT 'Pepsi', m.id      FROM marque m WHERE m.nom='Pepsi';

-- Liaison focaccia ↔ ingrédients
-- Raclaccia : 4 ingrédients (max)
INSERT INTO focaccia_ingredient (focaccia_id, ingredient_id)
SELECT f.id, i.id FROM focaccia f JOIN ingredient i ON f.nom='Raclaccia' AND i.nom IN ('Mozzarella','Oignon','Jambon','Ail');

-- Funghi : contient champignons
INSERT INTO focaccia_ingredient (focaccia_id, ingredient_id)
SELECT f.id, i.id FROM focaccia f JOIN ingredient i ON f.nom='Funghi' AND i.nom IN ('Champignons','Mozzarella','Tomate');

-- Margherina : classique
INSERT INTO focaccia_ingredient (focaccia_id, ingredient_id)
SELECT f.id, i.id FROM focaccia f JOIN ingredient i ON f.nom='Margherina' AND i.nom IN ('Tomate','Mozzarella','Basilic');

-- Aglio e Olio : à l'ail
INSERT INTO focaccia_ingredient (focaccia_id, ingredient_id)
SELECT f.id, i.id FROM focaccia f JOIN ingredient i ON f.nom='Aglio e Olio' AND i.nom IN ('Ail','Olive');

-- Verde
INSERT INTO focaccia_ingredient (focaccia_id, ingredient_id)
SELECT f.id, i.id FROM focaccia f JOIN ingredient i ON f.nom='Verde' AND i.nom IN ('Roquette','Pesto','Mozzarella');

-- Prosciutto
INSERT INTO focaccia_ingredient (focaccia_id, ingredient_id)
SELECT f.id, i.id FROM focaccia f JOIN ingredient i ON f.nom='Prosciutto' AND i.nom IN ('Jambon','Mozzarella','Tomate');
