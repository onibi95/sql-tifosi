USE tifosi;

-- Désactiver les contraintes temporairement
SET FOREIGN_KEY_CHECKS = 0;

-- Chargement de la table 'ingredient'
LOAD DATA LOCAL INFILE './absolu/ingredient.csv'
INTO TABLE ingredient
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Chargement de la table 'marque'
LOAD DATA LOCAL INFILE './absolu/marque.csv'
INTO TABLE marque
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Chargement de la table 'foccacia'
LOAD DATA LOCAL INFILE './absolu/foccacia.csv'
INTO TABLE foccacia
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Chargement de la table 'boisson'
LOAD DATA LOCAL INFILE './absolu/boisson.csv'
INTO TABLE boisson
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Population de la table 'appartient' (relation Marque-Boisson)
-- Basé sur les données dans boisson.csv
INSERT INTO appartient (id_marque, id_boisson) VALUES
(1, 1), -- Coca-cola -> Coca-cola zéro
(1, 2), -- Coca-cola -> Coca-cola original
(1, 3), -- Coca-cola -> Fanta citron
(1, 4), -- Coca-cola -> Fanta orange
(1, 5), -- Coca-cola -> Capri-sun
(4, 6), -- Pepsico -> Pepsi
(4, 7), -- Pepsico -> Pepsi Max Zéro
(4, 8), -- Pepsico -> Lipton zéro citron
(4, 9), -- Pepsico -> Lipton Peach
(3, 10), -- Monster -> Monster energy ultra gold
(3, 11), -- Monster -> Monster energy ultra blue
(2, 12); -- Cristalline -> Eau de source

-- Population de la table 'comprend' (relation foccacia-Ingredient)
-- Basé sur les recettes dans foccacia.csv avec les quantités par défaut
INSERT INTO comprend (id_foccacia, id_ingredient, quantite) VALUES
-- Mozaccia (id=1): Base tomate, Mozarella, cresson, jambon fumé, ail, artichaut, champignon, parmesan, poivre, olive noire
(1, 5, 200), -- Base tomate
(1, 25, 50), -- Mozarella
(1, 9, 20),  -- Cresson
(1, 13, 80), -- Jambon fumé
(1, 1, 2),   -- Ail
(1, 3, 20),  -- Artichaut
(1, 7, 40),  -- Champignon
(1, 18, 50), -- Parmesan
(1, 20, 1),  -- Poivre
(1, 16, 20), -- Olive noire

-- Gorgonzollaccia (id=2): Base tomate, Gorgonzola, cresson, ail, champignon, parmesan, poivre, olive noire
(2, 5, 200), -- Base tomate
(2, 11, 50), -- Gorgonzola
(2, 9, 20),  -- Cresson
(2, 1, 2),   -- Ail
(2, 7, 40),  -- Champignon
(2, 18, 50), -- Parmesan
(2, 20, 1),  -- Poivre
(2, 16, 20), -- Olive noire

-- Raclaccia (id=3): Base tomate, raclette, cresson, ail, champignon, parmesan, poivre
(3, 5, 200), -- Base tomate
(3, 22, 50), -- Raclette
(3, 9, 20),  -- Cresson
(3, 1, 2),   -- Ail
(3, 7, 40),  -- Champignon
(3, 18, 50), -- Parmesan
(3, 20, 1),  -- Poivre

-- Emmentalaccia (id=4): Base crème, Emmental, cresson, champignon, parmesan, poivre, oignon
(4, 6, 200), -- Base crème
(4, 10, 50), -- Emmental
(4, 9, 20),  -- Cresson
(4, 7, 40),  -- Champignon
(4, 18, 50), -- Parmesan
(4, 20, 1),  -- Poivre
(4, 15, 20), -- Oignon

-- Tradizione (id=5): Base tomate, Mozarella, cresson, jambon cuit, champignon(80), parmesan, poivre, olive noire(10), olive verte(10)
(5, 5, 200), -- Base tomate
(5, 25, 50), -- Mozarella
(5, 9, 20),  -- Cresson
(5, 12, 80), -- Jambon cuit
(5, 7, 80),  -- Champignon (quantité spécifiée)
(5, 18, 50), -- Parmesan
(5, 20, 1),  -- Poivre
(5, 16, 10), -- Olive noire (quantité spécifiée)
(5, 17, 10), -- Olive verte (quantité spécifiée)

-- Hawaienne (id=6): Base tomate, Mozarella, cresson, bacon, ananas, piment, parmesan, poivre, olive noire
(6, 5, 200), -- Base tomate
(6, 25, 50), -- Mozarella
(6, 9, 20),  -- Cresson
(6, 4, 80),  -- Bacon
(6, 2, 40),  -- Ananas
(6, 19, 2),  -- Piment
(6, 18, 50), -- Parmesan
(6, 20, 1),  -- Poivre
(6, 16, 20), -- Olive noire

-- Américaine (id=7): Base tomate, Mozarella, cresson, bacon, pomme de terre(40), parmesan, poivre, olive noire
(7, 5, 200), -- Base tomate
(7, 25, 50), -- Mozarella
(7, 9, 20),  -- Cresson
(7, 4, 80),  -- Bacon
(7, 21, 40), -- Pomme de terre (quantité spécifiée)
(7, 18, 50), -- Parmesan
(7, 20, 1),  -- Poivre
(7, 16, 20), -- Olive noire

-- Paysanne (id=8): Base crème, Chèvre, cresson, pomme de terre, jambon fumé, ail, artichaut, champignon, parmesan, poivre, olive noire, oeuf
(8, 6, 200), -- Base crème
(8, 8, 50),  -- Chèvre
(8, 9, 20),  -- Cresson
(8, 21, 80), -- Pomme de terre
(8, 13, 80), -- Jambon fumé
(8, 1, 2),   -- Ail
(8, 3, 20),  -- Artichaut
(8, 7, 40),  -- Champignon
(8, 18, 50), -- Parmesan
(8, 20, 1),  -- Poivre
(8, 16, 20), -- Olive noire
(8, 14, 50); -- Oeuf

-- Insertion de quelques données d'exemple pour les autres tables
-- Table client (données d'exemple)
INSERT INTO client (nom, email, code_postal) VALUES
('Martin Dupont', 'martin.dupont@email.com', 75001),
('Sophie Bernard', 'sophie.bernard@email.com', 69001),
('Pierre Durand', 'pierre.durand@email.com', 13001),
('Marie Petit', 'marie.petit@email.com', 31000),
('Jean Moreau', 'jean.moreau@email.com', 59000);

-- Table menu (données d'exemple)
INSERT INTO menu (nom, prix) VALUES
('Menu Mozaccia', 12.80),
('Menu Gorgonzollaccia', 13.80),
('Menu Raclaccia', 11.90),
('Menu Hawaienne', 14.20),
('Menu Paysanne', 15.80);

-- Table est_constitue (relation foccacia-Menu)
INSERT INTO est_constitue (id_foccacia, id_menu) VALUES
(1, 1), -- Mozaccia dans Menu Mozaccia
(2, 2), -- Gorgonzollaccia dans Menu Gorgonzollaccia
(3, 3), -- Raclaccia dans Menu Raclaccia
(6, 4), -- Hawaienne dans Menu Hawaienne
(8, 5); -- Paysanne dans Menu Paysanne

-- Table contient (relation Menu-Boisson)
INSERT INTO contient (id_menu, id_boisson) VALUES
(1, 1), -- Menu Mozaccia avec Coca-cola zéro
(1, 12), -- Menu Mozaccia avec Eau de source
(2, 2), -- Menu Gorgonzollaccia avec Coca-cola original
(2, 6), -- Menu Gorgonzollaccia avec Pepsi
(3, 3), -- Menu Raclaccia avec Fanta citron
(3, 8), -- Menu Raclaccia avec Lipton zéro citron
(4, 4), -- Menu Hawaienne avec Fanta orange
(4, 10), -- Menu Hawaienne avec Monster energy ultra gold
(5, 5), -- Menu Paysanne avec Capri-sun
(5, 11); -- Menu Paysanne avec Monster energy ultra blue

-- Table achete (relation Client-Menu) - données d'exemple
INSERT INTO achete (id_client, id_menu, date_achat) VALUES
(1, 1, '2024-01-15'),
(1, 3, '2024-01-20'),
(2, 2, '2024-01-16'),
(3, 4, '2024-01-17'),
(4, 5, '2024-01-18'),
(5, 1, '2024-01-19'),
(2, 3, '2024-01-21'),
(3, 2, '2024-01-22');

-- Réactiver les contraintes
SET FOREIGN_KEY_CHECKS = 1;