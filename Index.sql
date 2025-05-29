-- Création de la base de données
CREATE DATABASE IF NOT EXISTS tifosi;
USE tifosi;

-- Création de l'utilisateur et attribution des droits
CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'jesuisunmotdepasse';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

-- Table Ingredient 
CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- Table Foccacia 
CREATE TABLE foccacia (
    id_foccacia INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0)
) ENGINE=InnoDB;


-- Table Client 
CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal INT NOT NULL
) ENGINE=InnoDB;

-- Table Menu 
CREATE TABLE menu (
    id_menu INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0)
) ENGINE=InnoDB;

-- Table Marque 
CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- Table Boisson 
CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- Table de liaison Comprend (relation Foccacia-Ingredient)
CREATE TABLE comprend (
    id_foccacia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite INT NOT NULL CHECK (quantite > 0),
    PRIMARY KEY (id_foccacia, id_ingredient),
    FOREIGN KEY (id_foccacia) REFERENCES foccacia(id_foccacia) ON DELETE CASCADE,
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table de liaison Achete (relation Client-Menu)
CREATE TABLE achete (
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    date_achat DATE NOT NULL,
    PRIMARY KEY (id_client, id_menu, date_achat),
    FOREIGN KEY (id_client) REFERENCES client(id_client) ON DELETE CASCADE,
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table de liaison Est Constitué (relation Foccacia-Menu)
CREATE TABLE est_constitue (
    id_foccacia INT NOT NULL,
    id_menu INT NOT NULL,
    PRIMARY KEY (id_foccacia, id_menu),
    FOREIGN KEY (id_foccacia) REFERENCES foccacia(id_foccacia) ON DELETE CASCADE,
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table de liaison Contient (relation Menu-Boisson)
CREATE TABLE contient (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    PRIMARY KEY (id_menu, id_boisson),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu) ON DELETE CASCADE,
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table de liaison Appartient (relation Marque-Boisson)
CREATE TABLE appartient (
    id_marque INT NOT NULL,
    id_boisson INT NOT NULL,
    PRIMARY KEY (id_marque, id_boisson),
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque) ON DELETE CASCADE,
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson) ON DELETE CASCADE
) ENGINE=InnoDB;