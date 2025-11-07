USE tifosi;
SELECT nom
FROM focaccia
ORDER BY nom ASC;
SELECT COUNT(*) AS total_ingredients
FROM ingredient;
SELECT ROUND(AVG(prix), 2) AS prix_moyen
FROM focaccia;