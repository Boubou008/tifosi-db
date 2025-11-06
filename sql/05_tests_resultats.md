# 🧪 Résultats des Requêtes SQL — Projet *Tifosi*

## 🎯 Objectif
Ce document présente les résultats d’exécution des 10 requêtes de validation du projet *Tifosi*.  
Chaque requête est accompagnée :
- d’un **objectif fonctionnel** (ce qu’on cherche à obtenir),
- du **code SQL exécuté**,
- du **résultat attendu** (selon les données de test du script 03),
- du **résultat obtenu** (copié depuis MySQL Workbench),
- et d’un **commentaire explicatif** sur le fonctionnement ou d’éventuels écarts.

---

| N° | But de la requête | Code SQL | Résultat attendu | Résultat obtenu | Commentaire |
|----|--------------------|-----------|------------------|-----------------|--------------|
| **1** | Afficher la liste des noms des focaccias par ordre alphabétique croissant. | ```sql<br>-- On sélectionne la colonne 'nom' de la table focaccia, puis on trie par ordre alphabétique.<br>SELECT nom FROM focaccia ORDER BY nom ASC;``` | Aglio e Olio, Funghi, Margherina, Prosciutto, Raclaccia, Verde | | ✅ Résultat attendu : affichage des 6 focaccias triées de A à Z. |

| **2** | Afficher le nombre total d’ingrédients. | ```sql<br>-- On compte toutes les lignes présentes dans la table 'ingredient'.<br>SELECT COUNT(*) AS total_ingredients FROM ingredient;``` | 12 | | ✅ Vérifie que tous les ingrédients ont bien été insérés. |

| **3** | Afficher le prix moyen des focaccias. | ```sql<br>-- On calcule la moyenne des prix, puis on arrondit à 2 décimales.<br>SELECT ROUND(AVG(prix), 2) AS prix_moyen FROM focaccia;``` | 8.95 | | ✅ Si le jeu de données est complet, la moyenne doit être environ 8.95 €. |

| **4** | Afficher la liste des boissons avec leur marque, triée par nom de boisson. | ```sql<br>-- On joint les tables 'boisson' et 'marque' pour afficher le nom de la boisson et sa marque associée.<br>SELECT b.nom AS boisson, m.nom AS marque FROM boisson b JOIN marque m ON m.id = b.marque_id ORDER BY b.nom;``` | Aranciata – San Pellegrino<br>Coca-Cola – Coca-Cola<br>Limonata – San Pellegrino<br>Pepsi – Pepsi | | ✅ Vérifie que la jointure fonctionne bien entre les deux tables. |

| **5** | Afficher la liste des ingrédients pour la focaccia “Raclaccia”. | ```sql<br>-- On relie les tables focaccia, focaccia_ingredient et ingredient pour récupérer la liste des ingrédients d’une focaccia spécifique.<br>SELECT i.nom FROM focaccia f JOIN focaccia_ingredient fi ON fi.focaccia_id = f.id JOIN ingredient i ON i.id = fi.ingredient_id WHERE f.nom = 'Raclaccia' ORDER BY i.nom;``` | Ail, Jambon, Mozzarella, Oignon | | ✅ Cette requête teste la relation N-N (focaccia ↔ ingrédients). |

| **6** | Afficher le nom et le nombre d’ingrédients pour chaque focaccia. | ```sql<br>-- On compte combien d’ingrédients sont associés à chaque focaccia via la table de liaison.<br>SELECT f.nom AS focaccia, COUNT(fi.ingredient_id) AS nb_ingredients FROM focaccia f LEFT JOIN focaccia_ingredient fi ON fi.focaccia_id = f.id GROUP BY f.id, f.nom ORDER BY f.nom;``` | Aglio e Olio: 2<br>Funghi: 3<br>Margherina: 3<br>Prosciutto: 3<br>Raclaccia: 4<br>Verde: 3 | | ✅ Vérifie le bon fonctionnement de la jointure et du GROUP BY. |

| **7** | Afficher le nom de la focaccia qui a le plus d’ingrédients. | ```sql<br>-- On utilise un HAVING avec une sous-requête pour trouver la focaccia ayant le maximum d’ingrédients.<br>SELECT f.nom, COUNT(fi.ingredient_id) AS nb_ingredients FROM focaccia f LEFT JOIN focaccia_ingredient fi ON fi.focaccia_id = f.id GROUP BY f.id, f.nom HAVING COUNT(fi.ingredient_id) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(*) AS cnt FROM focaccia f2 LEFT JOIN focaccia_ingredient fi2 ON fi2.focaccia_id = f2.id GROUP BY f2.id ) t );``` | Raclaccia – 4 | | ✅ Vérifie que la sous-requête fonctionne correctement (renvoie la focaccia la plus “chargée”). |

| **8** | Afficher la liste des focaccias qui contiennent de l’ail. | ```sql<br>-- On cherche toutes les focaccias qui contiennent un ingrédient dont le nom est 'Ail'.<br>SELECT DISTINCT f.nom FROM focaccia f JOIN focaccia_ingredient fi ON fi.focaccia_id = f.id JOIN ingredient i ON i.id = fi.ingredient_id WHERE LOWER(i.nom) = 'ail' ORDER BY f.nom;``` | Aglio e Olio, Raclaccia | | ✅ Teste la recherche sur la valeur d’un ingrédient. |

| **9** | Afficher la liste des ingrédients inutilisés. | ```sql<br>-- On affiche les ingrédients qui n’apparaissent dans aucune focaccia (LEFT JOIN + WHERE NULL).<br>SELECT i.nom FROM ingredient i LEFT JOIN focaccia_ingredient fi ON fi.ingredient_id = i.id WHERE fi.focaccia_id IS NULL ORDER BY i.nom;``` | Anchois, Câpres | | ✅ Vérifie la cohérence du jeu de données (certains ingrédients sont non utilisés). |

| **10** | Afficher la liste des focaccias qui n’ont pas de champignons. | ```sql<br>-- On sélectionne les focaccias pour lesquelles il n’existe aucun ingrédient nommé 'champignons'.<br>SELECT f.nom FROM focaccia f WHERE NOT EXISTS ( SELECT 1 FROM focaccia_ingredient fi JOIN ingredient i ON i.id = fi.ingredient_id WHERE fi.focaccia_id = f.id AND LOWER(i.nom) = 'champignons' ) ORDER BY f.nom;``` | Aglio e Olio, Margherina, Prosciutto, Raclaccia, Verde | | ✅ Vérifie la logique inverse (exclusion avec NOT EXISTS). |

---

## 🧩 Notes
- Les **résultats attendus** sont basés sur le jeu de données d’exemple fourni dans `03_load_sample_data.sql`.