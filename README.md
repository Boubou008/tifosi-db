# 🍕 Projet Base de Données — Tifosi

## 🎯 Objectif
Créer, peupler et vérifier une base de données MySQL pour le restaurant **Tifosi** à partir d’un modèle conceptuel.

Le travail comprend :
- La création de la base et de l’utilisateur MySQL
- La création du schéma (tables, contraintes, relations)
- L’insertion de données de test
- L’exécution de requêtes de vérification

---

## 🗂️ Structure du projet

```
tifosi-db/
├─ data/
│  ├─ focaccia.xlsx
│  ├─ ingredient.xlsx
│  ├─ boisson.xlsx
│  └─ marque.xlsx
│
├─ sql/
│  ├─ 01_create_db_and_user.sql
│  ├─ 02_schema.sql
│  ├─ 03_load_sample_data.sql
│  └─ 04_tests.sql
│
└─ README.md
```

---

## ⚙️ Prérequis
- **MySQL Server** (version 8.x)
- **MySQL Workbench**
- **Visual Studio Code**

---

## 🧱 Étapes d’installation

### 1️⃣ Création de la base et de l’utilisateur
Script : `sql/01_create_db_and_user.sql`

Ce script crée :
- la base de données `tifosi`
- un utilisateur `tifosi` avec mot de passe `ChangeMe!123` (modifiable)
- tous les droits sur cette base

**Commande à exécuter dans Workbench (avec root)** :
```sql
SOURCE "C:/Users/fxfec/Documents/CEF/Devoir base de données/tifosi-db/sql/01_create_db_and_user.sql";
```

---

### 2️⃣ Création du schéma
Script : `sql/02_schema.sql`

Ce script crée les tables :
- `ingredient`
- `focaccia`
- `marque`
- `boisson`
- `focaccia_ingredient`

Avec contraintes :
- clés primaires
- contraintes `UNIQUE`
- relations `FOREIGN KEY`
- vérifications `CHECK`

---

### 3️⃣ Jeu de données de test
Script : `sql/03_load_sample_data.sql`

Ce script insère un petit jeu de données cohérent (focaccias, boissons, ingrédients).  
Permet de valider le fonctionnement sans dépendre des fichiers Excel.

---

### 4️⃣ Requêtes de validation
Script : `sql/04_tests.sql`

Contient les 10 requêtes demandées pour vérifier le bon fonctionnement du modèle.

---

## 🧪 Résultats attendus / obtenus

| # | Objectif | Résultat attendu | Résultat obtenu | Commentaire |
|---|-----------|------------------|-----------------|--------------|
| 1 | Liste des focaccias (A→Z) | Aglio e Olio, Funghi, Margherina, Prosciutto, Raclaccia, Verde | | |
| 2 | Nombre total d’ingrédients | 12 | | |
| 3 | Prix moyen des focaccias | 8.95 | | |
| 4 | Boissons et marque | Aranciata–San Pellegrino, Coca-Cola–Coca-Cola, Limonata–San Pellegrino, Pepsi–Pepsi | | |
| 5 | Ingrédients de "Raclaccia" | Ail, Jambon, Mozzarella, Oignon | | |
| 6 | Nb ingrédients/focaccia | Aglio e Olio:2, Funghi:3, Margherina:3, Prosciutto:3, Raclaccia:4, Verde:3 | | |
| 7 | Focaccia avec le plus d’ingrédients | Raclaccia (4) | | |
| 8 | Focaccias contenant de l’ail | Aglio e Olio, Raclaccia | | |
| 9 | Ingrédients inutilisés | Anchois, Câpres | | |
| 10 | Focaccias sans champignons | Aglio e Olio, Margherina, Prosciutto, Raclaccia, Verde | | |

---

## 🧰 Commandes MySQL utiles

```sql
SHOW DATABASES;
USE tifosi;
SHOW TABLES;
DESCRIBE focaccia;
```

---

## 👨‍💻 Auteur
Projet réalisé par **[Feck François-Xavier]** dans le cadre du module *Base de données – CEF*.
