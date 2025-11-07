-- 04_tests.sql
USE tifosi;

-- 1. Noms des focaccias A→Z
SELECT nom AS focaccia
FROM focaccia
ORDER BY nom ASC;

-- 2. Nombre total d'ingrédients
SELECT COUNT(*) AS total_ingredients
FROM ingredient;

-- 3. Prix moyen des focaccias
SELECT ROUND(AVG(prix), 2) AS prix_moyen
FROM focaccia;

-- 4. Boissons avec leur marque, triées par nom de boisson
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
JOIN marque m ON m.id = b.marque_id
ORDER BY b.nom;

-- 5. Ingrédients pour la focaccia 'Raclaccia'
SELECT i.nom AS ingredient
FROM focaccia f
JOIN focaccia_ingredient fi ON fi.focaccia_id = f.id
JOIN ingredient i ON i.id = fi.ingredient_id
WHERE f.nom = 'Raclaccia'
ORDER BY i.nom;

-- 6. Nom et nombre d'ingrédients par focaccia
SELECT f.nom AS focaccia, COUNT(fi.ingredient_id) AS nb_ingredients
FROM focaccia f
LEFT JOIN focaccia_ingredient fi ON fi.focaccia_id = f.id
GROUP BY f.id, f.nom
ORDER BY f.nom;

-- 7. Focaccia qui a le plus d'ingrédients 
WITH c AS (
  SELECT f.id, f.nom, COUNT(fi.ingredient_id) AS n
  FROM focaccia f
  LEFT JOIN focaccia_ingredient fi ON fi.focaccia_id = f.id
  GROUP BY f.id, f.nom
), m AS (
  SELECT MAX(n) AS nmax FROM c
)
SELECT c.nom AS focaccia, c.n AS nb_ingredients_max
FROM c JOIN m ON c.n = m.nmax;

-- 8. Focaccias qui contiennent de l'ail
SELECT DISTINCT f.nom AS focaccia
FROM focaccia f
JOIN focaccia_ingredient fi ON fi.focaccia_id = f.id
JOIN ingredient i ON i.id = fi.ingredient_id
WHERE LOWER(i.nom) = 'ail'
ORDER BY f.nom;

-- 9. Ingrédients inutilisés
SELECT i.nom AS ingredient_non_utilise
FROM ingredient i
LEFT JOIN focaccia_ingredient fi ON fi.ingredient_id = i.id
WHERE fi.focaccia_id IS NULL
ORDER BY i.nom;

-- 10. Focaccias sans champignons
SELECT f.nom AS focaccia_sans_champignons
FROM focaccia f
WHERE NOT EXISTS (
  SELECT 1
  FROM focaccia_ingredient fi
  JOIN ingredient i ON i.id = fi.ingredient_id
  WHERE fi.focaccia_id = f.id
    AND LOWER(i.nom) = 'champignons'
)
ORDER BY f.nom;
