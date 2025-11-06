-- 02_schema.sql
-- Se connecter ensuite en 'tifosi' pour exécuter ce fichier.
USE tifosi;

-- Table des ingrédients
CREATE TABLE IF NOT EXISTS ingredient (
  id  INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL,
  CONSTRAINT uq_ingredient_nom UNIQUE (nom)
) ENGINE=InnoDB;

-- Table des focaccias
CREATE TABLE IF NOT EXISTS focaccia (
  id   INT AUTO_INCREMENT PRIMARY KEY,
  nom  VARCHAR(100) NOT NULL,
  prix DECIMAL(6,2) NOT NULL CHECK (prix >= 0),
  CONSTRAINT uq_focaccia_nom UNIQUE (nom)
) ENGINE=InnoDB;

-- Table des marques (pour les boissons)
CREATE TABLE IF NOT EXISTS marque (
  id  INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL,
  CONSTRAINT uq_marque_nom UNIQUE (nom)
) ENGINE=InnoDB;

-- Table des boissons
CREATE TABLE IF NOT EXISTS boisson (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  nom        VARCHAR(100) NOT NULL,
  marque_id  INT NOT NULL,
  CONSTRAINT uq_boisson UNIQUE (nom, marque_id),
  CONSTRAINT fk_boisson_marque
    FOREIGN KEY (marque_id) REFERENCES marque(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Relation N-N entre focaccia et ingredient
CREATE TABLE IF NOT EXISTS focaccia_ingredient (
  focaccia_id   INT NOT NULL,
  ingredient_id INT NOT NULL,
  PRIMARY KEY (focaccia_id, ingredient_id),
  CONSTRAINT fk_fi_focaccia
    FOREIGN KEY (focaccia_id) REFERENCES focaccia(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_fi_ingredient
    FOREIGN KEY (ingredient_id) REFERENCES ingredient(id)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;
