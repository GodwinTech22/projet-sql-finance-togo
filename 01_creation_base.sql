-- =====================================================
-- PROJET SQL : FINANCE AU TOGO (microfinance / banque)
-- Fichier 01 : création de la base de données
-- SGBD : PostgreSQL
-- =====================================================
-- À exécuter connecté à la base "postgres" :
--   psql -U postgres -f 01_creation_base.sql

DROP DATABASE IF EXISTS finance_togo;

CREATE DATABASE finance_togo
    ENCODING 'UTF8';

-- Ensuite, connecte-toi à la nouvelle base :
--   psql -U postgres -d finance_togo
-- (ou, dans psql :  \c finance_togo )
