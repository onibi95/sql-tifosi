USE tifosi;

-- Désactiver les contraintes temporairement
SET FOREIGN_KEY_CHECKS = 0;

-- Chargement de la table 'ingredient'
LOAD DATA LOCAL INFILE './absolu/ingredient.csv'
INTO TABLE ingredient
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Chargement de la table 'marque'
LOAD DATA LOCAL INFILE './absolu/marque.csv'
INTO TABLE marque
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Chargement de la table 'focaccia'
LOAD DATA LOCAL INFILE './absolu/focaccia.csv'
INTO TABLE focaccia
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Chargement de la table 'boisson'
LOAD DATA LOCAL INFILE './absolu/boisson.csv'
INTO TABLE boisson
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Réactiver les contraintes
SET FOREIGN_KEY_CHECKS = 1;