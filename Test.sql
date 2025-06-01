USE tifosi;

-- 1. Afficher la liste des noms des focaccias par ordre alphabétique croissant
SELECT nom
FROM foccacia
ORDER BY nom ASC;

-- 2. Afficher le nombre total d'ingrédients
SELECT COUNT(*) AS nombre_total_ingredients
FROM ingredient;

-- 3. Afficher le prix moyen des focaccias
SELECT AVG(prix) AS prix_moyen_focaccias
FROM foccacia;

-- 4. Afficher la liste des boissons avec leur marque, triée par nom de boisson
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
JOIN appartient a ON b.id_boisson = a.id_boisson
JOIN marque m ON a.id_marque = m.id_marque
ORDER BY b.nom ASC;

-- 5. Afficher la liste des ingrédients pour une Raclaccia
SELECT i.nom AS ingredient
FROM ingredient i
JOIN comprend c ON i.id_ingredient = c.id_ingredient
JOIN foccacia f ON c.id_foccacia = f.id_foccacia
WHERE f.nom = 'Raclaccia';

-- 6. Afficher le nom et le nombre d'ingrédients pour chaque foccacia
SELECT f.nom AS foccacia, COUNT(c.id_ingredient) AS nombre_ingredients
FROM foccacia f
LEFT JOIN comprend c ON f.id_foccacia = c.id_foccacia
GROUP BY f.id_foccacia, f.nom;

-- 7. Afficher le nom de la focaccia qui a le plus d'ingrédients
SELECT f.nom AS foccacia, COUNT(c.id_ingredient) AS nombre_ingredients
FROM foccacia f
JOIN comprend c ON f.id_foccacia = c.id_foccacia
GROUP BY f.id_foccacia, f.nom
ORDER BY nombre_ingredients DESC
LIMIT 1;

-- 8. Afficher la liste des focaccia qui contiennent de l'ail
SELECT DISTINCT f.nom AS foccacia
FROM foccacia f
JOIN comprend c ON f.id_foccacia = c.id_foccacia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail';

-- 9. Afficher la liste des ingrédients inutilisés
SELECT i.nom AS ingredient_inutilise
FROM ingredient i
LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient
WHERE c.id_ingredient IS NULL;

-- 10. Afficher la liste des focaccia qui n'ont pas de champignons
SELECT f.nom AS foccacia
FROM foccacia f
WHERE f.id_foccacia NOT IN (
    SELECT DISTINCT c.id_foccacia
    FROM comprend c
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Champignons'
);