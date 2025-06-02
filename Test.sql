USE tifosi;

-- 1. Afficher la liste des noms des foccacias par ordre alphabétique croissant
SELECT nom
FROM foccacia
ORDER BY nom ASC;

select '================================================================================================' AS '1';

-- 2. Afficher le nombre total d'ingrédients
SELECT COUNT(*) AS nombre_total_ingredients
FROM ingredient;

select '================================================================================================' AS '2';

-- 3. Afficher le prix moyen des foccacias
SELECT AVG(prix) AS prix_moyen_foccacias
FROM foccacia;

select '================================================================================================' AS '3';

-- 4. Afficher la liste des boissons avec leur marque, triée par nom de boisson
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
JOIN appartient a ON b.id_boisson = a.id_boisson
JOIN marque m ON a.id_marque = m.id_marque
ORDER BY b.nom ASC;

select '================================================================================================' AS '4';

-- 5. Afficher la liste des ingrédients pour une Raclaccia
SELECT i.nom AS ingredient
FROM ingredient i
JOIN comprend c ON i.id_ingredient = c.id_ingredient
JOIN foccacia f ON c.id_foccacia = f.id_foccacia
WHERE f.nom = 'Raclaccia';

select '================================================================================================' AS '5';

-- 6. Afficher le nom et le nombre d'ingrédients pour chaque foccacia
SELECT f.nom AS foccacia, COUNT(c.id_ingredient) AS nombre_ingredients
FROM foccacia f
LEFT JOIN comprend c ON f.id_foccacia = c.id_foccacia
GROUP BY f.id_foccacia, f.nom;

select '================================================================================================' AS '6';

-- 7. Afficher le nom de la foccacia qui a le plus d'ingrédients
SELECT f.nom AS foccacia_with_most_ingredients, COUNT(c.id_ingredient) AS ''
FROM foccacia f
JOIN comprend c ON f.id_foccacia = c.id_foccacia
GROUP BY f.id_foccacia, f.nom
ORDER BY f.nom DESC
LIMIT 1;

select '================================================================================================' AS '6';

-- 8. Afficher la liste des foccacia qui contiennent de l'ail
SELECT DISTINCT f.nom AS foccacia_with_garlic
FROM foccacia f
JOIN comprend c ON f.id_foccacia = c.id_foccacia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail';

select '================================================================================================' AS '8';

-- 9. Afficher la liste des ingrédients inutilisés
SELECT i.nom AS ingredient_inutilise
FROM ingredient i
LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient
WHERE c.id_ingredient IS NULL;

select '================================================================================================' AS '9';

-- 10. Afficher la liste des foccacia qui n'ont pas de champignons
SELECT f.nom AS foccacia_without_mushrooms
FROM foccacia f
WHERE f.id_foccacia NOT IN (
    SELECT DISTINCT c.id_foccacia
    FROM comprend c
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = 'champignon'
);