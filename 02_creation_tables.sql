-- =====================================================
-- Fichier 02 : création des tables
-- Monnaie : FCFA (XOF) -> pas de centimes en pratique
-- =====================================================

-- On supprime d'abord les tables enfants, puis les parents
DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS prets        CASCADE;
DROP TABLE IF EXISTS comptes      CASCADE;
DROP TABLE IF EXISTS clients      CASCADE;
DROP TABLE IF EXISTS agences      CASCADE;

-- 1) CREATION DE LA TABLE AGENCES 
CREATE TABLE agences (
    id_agence        INTEGER      PRIMARY KEY,
    nom_agence       VARCHAR(60)  NOT NULL,
    ville            VARCHAR(40)  NOT NULL,
    region           VARCHAR(30)  NOT NULL,
    date_ouverture   DATE         NOT NULL
);

-- 2) CREATION DE LA TABLE CLIENTS 
CREATE TABLE clients (
    id_client         INTEGER      PRIMARY KEY,
    nom               VARCHAR(40)  NOT NULL,
    prenom            VARCHAR(40)  NOT NULL,
    sexe              CHAR(1)      NOT NULL CHECK (sexe IN ('M', 'F')),
    date_naissance    DATE         NOT NULL,
    ville             VARCHAR(40)  NOT NULL,
    profession        VARCHAR(50),
    telephone         VARCHAR(15),
    date_inscription  DATE         NOT NULL,
    id_agence         INTEGER      NOT NULL REFERENCES agences(id_agence)
);

-- 3)  CREATION DE LA TABLE COMPTES 
CREATE TABLE comptes (
    id_compte        INTEGER        PRIMARY KEY,
    numero_compte    VARCHAR(15)    NOT NULL UNIQUE,
    id_client        INTEGER        NOT NULL REFERENCES clients(id_client),
    type_compte      VARCHAR(20)    NOT NULL CHECK (type_compte IN ('Courant', 'Épargne')),
    solde            NUMERIC(15,2)  NOT NULL DEFAULT 0,
    date_ouverture   DATE           NOT NULL,
    statut           VARCHAR(10)    NOT NULL CHECK (statut IN ('Actif', 'Inactif', 'Bloqué'))
);

-- 4) CREATION DE LA TABLE TRANSACTIONS
CREATE TABLE transactions (
    id_transaction     INTEGER        PRIMARY KEY,
    id_compte          INTEGER        NOT NULL REFERENCES comptes(id_compte),
    type_transaction   VARCHAR(20)    NOT NULL CHECK (type_transaction IN ('Dépôt', 'Retrait', 'Virement', 'Paiement facture')),
    montant            NUMERIC(15,2)  NOT NULL CHECK (montant > 0),
    date_transaction   DATE           NOT NULL,
    canal              VARCHAR(25)    NOT NULL,
    description        VARCHAR(100)
);

-- 5) CREATION DE LA TABLE PRETS 
CREATE TABLE prets (
    id_pret           INTEGER        PRIMARY KEY,
    id_client         INTEGER        NOT NULL REFERENCES clients(id_client),
    montant_accorde   NUMERIC(15,2)  NOT NULL CHECK (montant_accorde > 0),
    taux_interet      NUMERIC(4,2)   NOT NULL,   -- en % par an
    duree_mois        SMALLINT       NOT NULL CHECK (duree_mois > 0),
    date_octroi       DATE           NOT NULL,
    statut            VARCHAR(15)    NOT NULL CHECK (statut IN ('En cours', 'Remboursé', 'En retard')),
    objet             VARCHAR(80)
);
