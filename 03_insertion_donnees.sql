-- =====================================================
-- Fichier 03 : insertion des données (données fictives)
-- Ordre : parents d'abord (agences, clients), puis enfants
-- =====================================================

-- INSERTION DE LA TABLE AGENCES (15 lignes) 
INSERT INTO agences (id_agence, nom_agence, ville, region, date_ouverture) VALUES
(1,  'Agence Lomé Centre',      'Lomé',     'Maritime', '2005-03-01'),
(2,  'Agence Lomé Bè',          'Lomé',     'Maritime', '2008-06-15'),
(3,  'Agence Lomé Adidogomé',   'Lomé',     'Maritime', '2012-09-10'),
(4,  'Agence Lomé Agoè',        'Lomé',     'Maritime', '2016-01-20'),
(5,  'Agence Aného',            'Aného',    'Maritime', '2009-04-06'),
(6,  'Agence Tsévié',           'Tsévié',   'Maritime', '2010-10-11'),
(7,  'Agence Kpalimé',          'Kpalimé',  'Plateaux', '2007-02-19'),
(8,  'Agence Atakpamé',         'Atakpamé', 'Plateaux', '2006-05-22'),
(9,  'Agence Sokodé',           'Sokodé',   'Centrale', '2008-11-03'),
(10, 'Agence Kara',             'Kara',     'Kara',     '2007-09-17'),
(11, 'Agence Bassar',           'Bassar',   'Kara',     '2014-03-24'),
(12, 'Agence Dapaong',          'Dapaong',  'Savanes',  '2011-07-04'),
(13, 'Agence Mango',            'Mango',    'Savanes',  '2013-12-09'),
(14, 'Agence Notsé',            'Notsé',    'Plateaux', '2015-05-18'),
(15, 'Agence Badou',            'Badou',    'Plateaux', '2018-08-27');

-- INSERTION DE LA TABLE  CLIENTS (25 lignes) 
INSERT INTO clients (id_client, nom, prenom, sexe, date_naissance, ville, profession, telephone, date_inscription, id_agence) VALUES
(1,  'Mensah',    'Koffi',    'M', '1985-03-14', 'Lomé',     'Commerçant',           '+22890112233', '2018-02-10', 1),
(2,  'Dossou',    'Ama',      'F', '1992-07-21', 'Lomé',     'Enseignante',          '+22891223344', '2019-05-06', 2),
(3,  'Adjovi',    'Yawo',     'M', '1988-11-02', 'Lomé',     'Conducteur moto-taxi', '+22892334455', '2020-01-15', 3),
(4,  'Lawson',    'Afi',      'F', '1979-01-30', 'Lomé',     'Commerçante',          '+22893445566', '2017-09-12', 1),
(5,  'Amegah',    'Kodjo',    'M', '1995-05-18', 'Lomé',     'Informaticien',        '+22896556677', '2021-03-22', 4),
(6,  'Gbedemah',  'Essi',     'F', '1990-09-09', 'Aného',    'Couturière',           '+22897667788', '2019-11-04', 5),
(7,  'Tchalim',   'Komla',    'M', '1982-12-25', 'Tsévié',   'Agriculteur',          '+22898778899', '2016-06-20', 6),
(8,  'Akakpo',    'Mawuli',   'M', '1987-04-11', 'Kpalimé',  'Enseignant',           '+22899889900', '2018-08-13', 7),
(9,  'Houngbo',   'Abla',     'F', '1993-02-27', 'Kpalimé',  'Restauratrice',        '+22870990011', '2020-10-05', 7),
(10, 'Agbenou',   'Edem',     'M', '1980-06-16', 'Atakpamé', 'Fonctionnaire',        '+22879001122', '2015-04-14', 8),
(11, 'Bawa',      'Fatima',   'F', '1991-08-08', 'Sokodé',   'Commerçante',          '+22890112200', '2019-02-18', 9),
(12, 'Alassani',  'Ibrahim',  'M', '1984-10-03', 'Sokodé',   'Transporteur',         '+22891223311', '2017-12-01', 9),
(13, 'Tchedre',   'Yao',      'M', '1989-01-19', 'Kara',     'Ingénieur',            '+22892334422', '2018-07-23', 10),
(14, 'Kpatcha',   'Abalo',    'M', '1986-05-05', 'Kara',     'Agriculteur',          '+22893445533', '2016-03-09', 10),
(15, 'Nabine',    'Pyabalo',  'F', '1994-12-12', 'Bassar',   'Infirmière',           '+22896556644', '2021-01-11', 11),
(16, 'Yendoubé',  'Tindano',  'M', '1978-09-23', 'Dapaong',  'Éleveur',              '+22897667755', '2014-11-17', 12),
(17, 'Sama',      'Kandi',    'F', '1996-03-03', 'Dapaong',  'Étudiante',            '+22898778866', '2022-09-19', 12),
(18, 'Moussa',    'Salifou',  'M', '1983-07-07', 'Mango',    'Commerçant',           '+22899889977', '2017-05-29', 13),
(19, 'Dogbe',     'Sika',     'F', '1990-11-28', 'Notsé',    'Commerçante',          '+22870990088', '2019-09-30', 14),
(20, 'Kokou',     'Messan',   'M', '1975-02-14', 'Notsé',    'Agriculteur',          '+22879001199', '2013-01-21', 14),
(21, 'Atayi',     'Elom',     'M', '1997-08-15', 'Lomé',     'Étudiant',             '+22890123456', '2022-02-07', 3),
(22, 'Folly',     'Dédé',     'F', '1981-04-04', 'Lomé',     'Pharmacienne',         '+22891234567', '2016-10-10', 1),
(23, 'Ayité',     'Koami',    'F', '1998-06-26', 'Lomé',     'Coiffeuse',            '+22892345678', '2023-01-16', 4),
(24, 'Badjo',     'Têko',     'M', '1986-10-20', 'Badou',    'Planteur de café',     '+22893456789', '2018-04-02', 15),
(25, 'Ekoué',     'Sénam',    'F', '1992-12-01', 'Lomé',     'Comptable',            '+22896567890', '2020-06-08', 2);

-- INSERTION DE LA TABLE COMPTES (25 lignes) 
INSERT INTO comptes (id_compte, numero_compte, id_client, type_compte, solde, date_ouverture, statut) VALUES
(1,  'TG-0001', 1,  'Courant', 1250000, '2018-02-10', 'Actif'),
(2,  'TG-0002', 2,  'Épargne', 3400000, '2019-05-06', 'Actif'),
(3,  'TG-0003', 3,  'Courant',   85000, '2020-01-15', 'Actif'),
(4,  'TG-0004', 4,  'Courant', 2780000, '2017-09-12', 'Actif'),
(5,  'TG-0005', 5,  'Courant',  940000, '2021-03-22', 'Actif'),
(6,  'TG-0006', 6,  'Épargne',  310000, '2019-11-04', 'Actif'),
(7,  'TG-0007', 7,  'Épargne',  560000, '2016-06-20', 'Actif'),
(8,  'TG-0008', 8,  'Courant', 1120000, '2018-08-13', 'Actif'),
(9,  'TG-0009', 9,  'Courant',   45000, '2020-10-05', 'Inactif'),
(10, 'TG-0010', 10, 'Épargne', 4850000, '2015-04-14', 'Actif'),
(11, 'TG-0011', 11, 'Courant',  670000, '2019-02-18', 'Actif'),
(12, 'TG-0012', 12, 'Courant', 1980000, '2017-12-01', 'Actif'),
(13, 'TG-0013', 13, 'Courant', 3150000, '2018-07-23', 'Actif'),
(14, 'TG-0014', 14, 'Épargne',  275000, '2016-03-09', 'Actif'),
(15, 'TG-0015', 15, 'Courant',  420000, '2021-01-11', 'Actif'),
(16, 'TG-0016', 16, 'Épargne', 2260000, '2014-11-17', 'Actif'),
(17, 'TG-0017', 17, 'Courant',   15000, '2022-09-19', 'Actif'),
(18, 'TG-0018', 18, 'Courant', 1430000, '2017-05-29', 'Bloqué'),
(19, 'TG-0019', 19, 'Courant',  510000, '2019-09-30', 'Actif'),
(20, 'TG-0020', 20, 'Épargne',  890000, '2013-01-21', 'Actif'),
(21, 'TG-0021', 1,  'Épargne', 2100000, '2019-01-08', 'Actif'),
(22, 'TG-0022', 2,  'Courant',  760000, '2019-06-10', 'Actif'),
(23, 'TG-0023', 4,  'Épargne', 1650000, '2018-03-15', 'Actif'),
(24, 'TG-0024', 13, 'Épargne', 5200000, '2019-02-04', 'Actif'),
(25, 'TG-0025', 22, 'Courant', 2390000, '2016-10-10', 'Actif');

-- INSERTION DE LA TABLE TRANSACTIONS (30 lignes) 
INSERT INTO transactions (id_transaction, id_compte, type_transaction, montant, date_transaction, canal, description) VALUES
(1,  1,  'Dépôt',            250000,  '2026-01-05', 'Agence',             'Dépôt de recettes commerciales'),
(2,  1,  'Retrait',          100000,  '2026-01-12', 'Distributeur',       'Retrait au distributeur'),
(3,  2,  'Dépôt',            500000,  '2026-01-15', 'Agence',             'Versement salaire'),
(4,  3,  'Retrait',           25000,  '2026-01-18', 'Mobile Money',       'Retrait mobile'),
(5,  4,  'Dépôt',            800000,  '2026-02-02', 'Agence',             'Vente de marchandises'),
(6,  5,  'Virement',         150000,  '2026-02-05', 'Application mobile', 'Virement loyer'),
(7,  6,  'Dépôt',             60000,  '2026-02-10', 'Mobile Money',       'Épargne mensuelle'),
(8,  7,  'Dépôt',            200000,  '2026-02-14', 'Agence',             'Vente récolte de maïs'),
(9,  8,  'Paiement facture',  18500,  '2026-02-20', 'Application mobile', 'Facture électricité CEET'),
(10, 10, 'Dépôt',           1000000,  '2026-02-25', 'Agence',             'Prime annuelle'),
(11, 11, 'Retrait',           75000,  '2026-03-03', 'Distributeur',       'Retrait au distributeur'),
(12, 12, 'Virement',         300000,  '2026-03-07', 'Application mobile', 'Paiement fournisseur'),
(13, 13, 'Dépôt',            900000,  '2026-03-10', 'Agence',             'Versement salaire'),
(14, 14, 'Dépôt',             40000,  '2026-03-15', 'Mobile Money',       'Épargne mensuelle'),
(15, 15, 'Paiement facture',  12000,  '2026-03-18', 'Mobile Money',       'Facture eau TdE'),
(16, 16, 'Retrait',          500000,  '2026-03-22', 'Agence',             'Achat de bétail'),
(17, 17, 'Dépôt',             15000,  '2026-03-28', 'Mobile Money',       'Argent de poche'),
(18, 19, 'Dépôt',            120000,  '2026-04-02', 'Agence',             'Recettes du marché'),
(19, 20, 'Retrait',           50000,  '2026-04-06', 'Distributeur',       'Retrait au distributeur'),
(20, 21, 'Dépôt',            400000,  '2026-04-10', 'Application mobile', 'Épargne projet'),
(21, 22, 'Virement',         220000,  '2026-04-14', 'Application mobile', 'Aide familiale'),
(22, 23, 'Dépôt',            350000,  '2026-04-20', 'Agence',             'Épargne trimestrielle'),
(23, 24, 'Dépôt',           1500000,  '2026-04-25', 'Agence',             'Épargne projet immobilier'),
(24, 25, 'Paiement facture',  45000,  '2026-05-04', 'Application mobile', 'Abonnement internet'),
(25, 1,  'Dépôt',            180000,  '2026-05-09', 'Mobile Money',       'Recettes boutique'),
(26, 4,  'Retrait',          400000,  '2026-05-15', 'Agence',             'Achat de stock'),
(27, 8,  'Dépôt',            350000,  '2026-05-20', 'Agence',             'Versement salaire'),
(28, 10, 'Retrait',          200000,  '2026-06-01', 'Distributeur',       'Retrait au distributeur'),
(29, 12, 'Dépôt',            600000,  '2026-06-08', 'Agence',             'Recettes transport'),
(30, 2,  'Virement',         100000,  '2026-06-12', 'Application mobile', 'Cotisation tontine');

-- INSERTION DE LA TABLE PRETS (20 lignes) 
INSERT INTO prets (id_pret, id_client, montant_accorde, taux_interet, duree_mois, date_octroi, statut, objet) VALUES
(1,  1,  2000000,  12.50, 24, '2024-03-01', 'En cours',  'Fonds de roulement commerce'),
(2,  4,  5000000,  11.00, 36, '2023-06-15', 'En cours',  'Achat de stock'),
(3,  7,  1500000,   9.50, 12, '2024-02-10', 'Remboursé', 'Intrants agricoles'),
(4,  3,   600000,  14.00, 12, '2025-01-20', 'En retard', 'Achat moto-taxi'),
(5,  10, 8000000,   8.50, 60, '2022-09-01', 'En cours',  'Construction maison'),
(6,  12, 6500000,  10.50, 48, '2023-11-05', 'En cours',  'Achat camion'),
(7,  14,  800000,   9.50, 12, '2025-03-12', 'En cours',  'Matériel agricole'),
(8,  16, 3000000,  10.00, 24, '2023-04-18', 'Remboursé', 'Achat bétail'),
(9,  9,   700000,  13.50, 18, '2024-08-09', 'En retard', 'Équipement restaurant'),
(10, 11, 1200000,  12.00, 18, '2024-10-14', 'En cours',  'Stock de marchandises'),
(11, 13, 12000000,  8.00, 84, '2021-07-30', 'En cours',  'Prêt immobilier'),
(12, 18, 2500000,  11.50, 24, '2024-05-27', 'En retard', 'Stock de marchandises'),
(13, 19,  900000,  13.00, 12, '2025-06-02', 'En cours',  'Fonds de roulement commerce'),
(14, 20, 1800000,   9.00, 24, '2022-01-19', 'Remboursé', 'Équipement agricole'),
(15, 22, 4000000,  10.00, 36, '2024-12-03', 'En cours',  'Aménagement pharmacie'),
(16, 6,   450000,  14.50, 12, '2025-04-22', 'En cours',  'Achat machines à coudre'),
(17, 15, 1000000,  10.00, 18, '2025-02-17', 'En cours',  'Formation et équipement'),
(18, 24, 3500000,   9.00, 36, '2022-05-23', 'Remboursé', 'Extension plantation de café'),
(19, 2,  2200000,  10.50, 24, '2023-09-11', 'Remboursé', 'Équipement domestique'),
(20, 5,  1500000,  12.00, 12, '2025-09-01', 'En cours',  'Achat ordinateur');

-- Vérification rapide : nombre de lignes par table
SELECT 'agences' AS table_nom, COUNT(*) AS nb_lignes FROM agences
UNION ALL SELECT 'clients',      COUNT(*) FROM clients
UNION ALL SELECT 'comptes',      COUNT(*) FROM comptes
UNION ALL SELECT 'transactions', COUNT(*) FROM transactions
UNION ALL SELECT 'prets',        COUNT(*) FROM prets;
