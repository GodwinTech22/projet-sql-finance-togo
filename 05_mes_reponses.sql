-- =====================================================
-- Réponses aux 10 questions business — Finance au Togo
-- Base : finance_togo (PostgreSQL)
-- =====================================================

-- Q1 : Combien de clients, et combien de femmes ?
SELECT COUNT(*) AS nb_clients
FROM clients;

SELECT COUNT(*) AS nb_femmes
FROM clients
WHERE sexe = 'F';

-- Q2 : Les 5 comptes avec les soldes les plus élevés
SELECT numero_compte, type_compte, solde
FROM comptes
ORDER BY solde DESC
LIMIT 5;

-- Q3 : Total des soldes des comptes actifs
SELECT SUM(solde) AS total_soldes_actifs
FROM comptes
WHERE statut = 'Actif';

-- Q4 : Solde moyen, minimum et maximum des comptes d'épargne
SELECT ROUND(AVG(solde), 0) AS solde_moyen,
       MIN(solde)           AS solde_min,
       MAX(solde)           AS solde_max
FROM comptes
WHERE type_compte = 'Épargne';

-- Q5 : Comptes dont le solde est inférieur à 100 000 FCFA
SELECT numero_compte, type_compte, solde, statut
FROM comptes
WHERE solde < 100000
ORDER BY solde ASC;

-- Q6 : Villes avec au moins 2 clients
SELECT ville, COUNT(*) AS nb_clients
FROM clients
GROUP BY ville
HAVING COUNT(*) >= 2
ORDER BY nb_clients DESC, ville;

-- Q7 : Montant total des dépôts par canal
SELECT canal, SUM(montant) AS total_depots
FROM transactions
WHERE type_transaction = 'Dépôt'
GROUP BY canal
ORDER BY total_depots DESC;

-- Q8 : Les 3 plus gros retraits
SELECT montant, date_transaction, description
FROM transactions
WHERE type_transaction = 'Retrait'
ORDER BY montant DESC
LIMIT 3;

-- Q9 : Par statut de prêt : nombre, montant total, taux moyen (statuts avec >= 3 prêts)
SELECT statut,
       COUNT(*)                 AS nb_prets,
       SUM(montant_accorde)     AS montant_total,
       ROUND(AVG(taux_interet), 2) AS taux_moyen
FROM prets
GROUP BY statut
HAVING COUNT(*) >= 3
ORDER BY nb_prets DESC;

-- Q10 : Prêts > 2 000 000 FCFA et > 24 mois : les 3 taux les plus bas
SELECT id_pret, montant_accorde, taux_interet, duree_mois, objet
FROM prets
WHERE montant_accorde > 2000000
  AND duree_mois > 24
ORDER BY taux_interet ASC
LIMIT 3;
