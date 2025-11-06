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
│  ├─ 04_tests.sql
│  └─ 05_tests_resultats.md
│
└─ README.md
```

---

## ⚙️ Prérequis
- **MySQL Server** (version 8.x)
- **MySQL Workbench**
- **Visual Studio Code**

---

## 🧱 Étapes du projet

### 1️⃣ Création de la base et de l’utilisateur
Script : `sql/01_create_db_and_user.sql`

Ce script crée :
- la base de données `tifosi`
- un utilisateur `tifosi` avec mot de passe `Password!`
- tous les droits sur cette base

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

Ce script contient les 10 requêtes de vérification du modèle.  
Les résultats sont consignés ci-dessous.

---

## 🧪 Résultats des requêtes SQL

🔗 Voir le détail des résultats : [sql/05_tests_resultats.md](./sql/05_tests_resultats.md)


---

## 💾 Dépôt GitHub

Le dépôt contient :
- le dossier `sql/` avec tous les scripts SQL
- le dossier `data/`
- le présent fichier `README.md` complété

Nom de dépôt : **tifosi-db**

---

## 👨‍💻 Auteur
Projet réalisé par **[Feck François-Xavier]** dans le cadre du module *Base de données – CEF*.
