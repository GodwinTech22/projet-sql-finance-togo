#  Projet SQL — Finance au Togo

Mini-projet d'entraînement SQL sous **PostgreSQL** : base de données fictive d'un établissement financier togolais (agences, clients, comptes, transactions, prêts). Tous les montants sont en **FCFA**.

##  Objectifs

- Concevoir un modèle relationnel avec clés primaires (PK) et clés étrangères (FK)
- Pratiquer `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Utiliser les fonctions d'agrégation `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- Regrouper et filtrer des groupes avec `GROUP BY` et `HAVING`
- Utiliser les alias avec `AS`

##  Modèle de données

```
agences (1) ────< clients (1) ────< comptes (1) ────< transactions
                      │
                      └────< prets
```

| Table | Description | PK | FK | Lignes |
|---|---|---|---|---|
| `agences` | Agences réparties dans les 5 régions du Togo | `id_agence` | — | 15 |
| `clients` | Clients de l'établissement | `id_client` | `id_agence` | 25 |
| `comptes` | Comptes courants et d'épargne | `id_compte` | `id_client` | 25 |
| `transactions` | Dépôts, retraits, virements, paiements de factures | `id_transaction` | `id_compte` | 30 |
| `prets` | Prêts accordés aux clients | `id_pret` | `id_client` | 20 |

## Structure du projet


├── 01_creation_base.sql        # Création de la base finance_togo
├── 02_creation_tables.sql      # Création des 5 tables (PK, FK, contraintes)
├── 03_insertion_donnees.sql    # Insertion des données fictives
├── 04_questions_business.md    # Les 10 questions à résoudre
├── 05_mes_reponses.sql         # Mes requêtes SQL
└── README.md
```

## ▶ Exécution

### En ligne de commande (psql)

```bash
psql -U postgres -f 01_creation_base.sql
psql -U postgres -d finance_togo -f 02_creation_tables.sql
psql -U postgres -d finance_togo -f 03_insertion_donnees.sql
```

### Avec VS Code et SQLTools

1. Créer une connexion `postgres_admin` (base `postgres`) et exécuter `01_creation_base.sql`
2. Créer une connexion `finance_togo` (base `finance_togo`)
3. Exécuter `02_creation_tables.sql` puis `03_insertion_donnees.sql` sur la connexion `finance_togo`

Vérification : la requête finale du fichier 03 doit afficher 15, 25, 25, 30 et 20 lignes.

---

##  Questions business et résultats

### Q1 — Combien de clients la banque compte-t-elle, et combien sont des femmes ?

```sql
SELECT COUNT(*) AS nb_clients
FROM clients;

SELECT COUNT(*) AS nb_femmes
FROM clients
WHERE sexe = 'F';
```

| nb_clients | nb_femmes |
|---|---|
| 25 | 11 |

**Interprétation :** la banque compte 25 clients, dont 11 femmes, soit 44 % de la clientèle.

---

### Q2 — Quels sont les 5 comptes avec les soldes les plus élevés ?

```sql
SELECT numero_compte, type_compte, solde
FROM comptes
ORDER BY solde DESC
LIMIT 5;

| numero_compte | type_compte | solde |
|---|---|---|
| TG-0024 | Épargne | 5 200 000 |
| TG-0010 | Épargne | 4 850 000 |
| TG-0002 | Épargne | 3 400 000 |
| TG-0013 | Courant | 3 150 000 |
| TG-0004 | Courant | 2 780 000 |

**Interprétation :** trois des cinq plus gros soldes sont des comptes d'épargne.


### Q3 — Quel est le total des soldes des comptes actifs ?

```sql
SELECT SUM(solde) AS total_soldes_actifs
FROM comptes
WHERE statut = 'Actif';
```

| total_soldes_actifs |
|---|
| 37 565 000 |

**Interprétation :** les comptes actifs détiennent 37,565 millions de FCFA. Les comptes inactifs ou bloqués sont exclus.


### Q4 — Quels sont le solde moyen, minimum et maximum des comptes d'épargne ?

```sql
SELECT ROUND(AVG(solde), 0) AS solde_moyen,
       MIN(solde)           AS solde_min,
       MAX(solde)           AS solde_max
FROM comptes
WHERE type_compte = 'Épargne';
```

| solde_moyen | solde_min | solde_max |
|---|---|---|
| 2 149 500 | 275 000 | 5 200 000 |

**Interprétation :** l'écart entre le plus petit et le plus gros compte d'épargne est important (de 275 000 à 5 200 000 FCFA).


### Q5 — Quels comptes ont un solde inférieur à 100 000 FCFA ?

```sql
SELECT numero_compte, type_compte, solde, statut
FROM comptes
WHERE solde < 100000
ORDER BY solde ASC;

| numero_compte | type_compte | solde | statut |
|---|---|---|---|
| TG-0017 | Courant | 15 000 | Actif |
| TG-0009 | Courant | 45 000 | Inactif |
| TG-0003 | Courant | 85 000 | Actif |

**Interprétation :** trois comptes courants ont un faible solde, dont un compte inactif à surveiller.

---

### Q6 — Dans quelles villes la banque a-t-elle au moins 2 clients ?

```sql
SELECT ville, COUNT(*) AS nb_clients
FROM clients
GROUP BY ville
HAVING COUNT(*) >= 2
ORDER BY nb_clients DESC, ville;

| ville | nb_clients |
|---|---|
| Lomé | 9 |
| Dapaong | 2 |
| Kara | 2 |
| Kpalimé | 2 |
| Notsé | 2 |
| Sokodé | 2 |

**Interprétation :** Lomé concentre 9 clients sur 25 (36 %). Cinq autres villes ont chacune 2 clients.


### Q7 — Quel est le montant total des dépôts par canal ?

```sql
SELECT canal, SUM(montant) AS total_depots
FROM transactions
WHERE type_transaction = 'Dépôt'
GROUP BY canal
ORDER BY total_depots DESC;

| canal | total_depots |
|---|---|
| Agence | 6 570 000 |
| Application mobile | 400 000 |
| Mobile Money | 295 000 |

**Interprétation :** les dépôts passent surtout par les agences (6,57 M sur 7,265 M, soit environ 90 %). Les canaux numériques restent marginaux.


### Q8 — Quels sont les 3 plus gros retraits effectués ?

```sql
SELECT montant, date_transaction, description
FROM transactions
WHERE type_transaction = 'Retrait'
ORDER BY montant DESC
LIMIT 3;

| montant | date_transaction | description |
|---|---|---|
| 500 000 | 2026-03-22 | Achat de bétail |
| 400 000 | 2026-05-15 | Achat de stock |
| 200 000 | 2026-06-01 | Retrait au distributeur |

**Interprétation :** les deux plus gros retraits servent à des achats professionnels (bétail et stock).


### Q9 — Pour chaque statut de prêt : nombre, montant total et taux moyen (au moins 3 prêts)

```sql
SELECT statut,
       COUNT(*)                    AS nb_prets,
       SUM(montant_accorde)        AS montant_total,
       ROUND(AVG(taux_interet), 2) AS taux_moyen
FROM prets
GROUP BY statut
HAVING COUNT(*) >= 3
ORDER BY nb_prets DESC;

| statut | nb_prets | montant_total | taux_moyen |
|---|---|---|---|
| En cours | 12 | 43 350 000 | 10,96 |
| Remboursé | 5 | 12 000 000 | 9,60 |
| En retard | 3 | 3 800 000 | 13,00 |

**Interprétation :** les prêts en retard ont le taux moyen le plus élevé (13 %), et les prêts remboursés le plus bas (9,6 %). Un taux élevé semble lié à un risque de retard plus important.


### Q10 — Parmi les prêts de plus de 2 000 000 FCFA et de plus de 24 mois, quels sont les 3 avec le taux le plus bas ?

```sql
SELECT id_pret, montant_accorde, taux_interet, duree_mois, objet
FROM prets
WHERE montant_accorde > 2000000
  AND duree_mois > 24
ORDER BY taux_interet ASC
LIMIT 3;

| id_pret | montant_accorde | taux_interet | duree_mois | objet |
|---|---|---|---|---|
| 11 | 12 000 000 | 8,00 | 84 | Prêt immobilier |
| 5 | 8 000 000 | 8,50 | 60 | Construction maison |
| 18 | 3 500 000 | 9,00 | 36 | Extension plantation de café |

**Interprétation :** les taux les plus bas concernent les prêts les plus gros et les plus longs, surtout dans l'immobilier.


##  Ce que j'ai appris

- Concevoir un schéma relationnel avec PK, FK et contraintes (`CHECK`, `NOT NULL`, `UNIQUE`)
- Ordonner les scripts : créer les tables parents avant les tables enfants
- Filtrer les lignes avec `WHERE` et filtrer les groupes avec `HAVING`
- Résumer des données avec `COUNT`, `SUM`, `AVG`, `MIN`, `MAX` et `GROUP BY`
- Connecter VS Code à PostgreSQL avec SQLTools et isoler un projet dans sa propre base

##  Auteur

**Komi Godwin HONKU** — Etudiant en Intelligence Artificielle et Big Data, École Nationale Polytechnique (Ex-EPL), Campus de Lomé, Togo.

> Les données de ce projet sont entièrement fictives.