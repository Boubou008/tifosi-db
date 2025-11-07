-- 01_create_db_and_user.sql
-- À exécuter avec un compte admin (root par ex.)

CREATE DATABASE IF NOT EXISTS tifosi
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'Password!';

GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;
