-- 
-- A importer/exécuter en tant qu'administrateur PostgreSQL
-- 


-- Créer l'utilisateur qisport
CREATE USER qisport;

-- Donne les droits à l'utilisateur qisport de créer une database
ALTER ROLE qisport WITH CREATEDB;

-- Créer la database 'qisport_db' pour qisport
CREATE DATABASE qisport_db OWNER qisport;

-- Donne le mot de passe 'cronos' à l'utilisateur qisport
ALTER USER qisport WITH ENCRYPTED PASSWORD 'mnemosyne';

