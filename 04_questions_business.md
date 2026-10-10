# 10 questions business — Finance au Togo

Écris tes requêtes dans un fichier `05_mes_reponses.sql`, puis copie les résultats dans ton README.
Monnaie : FCFA. Chaque question utilise **une seule table**.

> 💡 Les questions 6, 7 et 9 utilisent `GROUP BY` (pour regrouper les lignes avant de compter ou sommer). C'est le petit pas qui rend `HAVING` utile : `HAVING` filtre les groupes, comme `WHERE` filtre les lignes.

---

### Q1 — Combien de clients la banque compte-t-elle, et combien sont des femmes ?
Tables : `clients` · Outils : `COUNT`, `WHERE`, alias
*Indice : deux requêtes, ou une seule avec `COUNT(*)` puis `WHERE sexe = 'F'`.*

### Q2 — Quels sont les 5 comptes avec les soldes les plus élevés ?
Tables : `comptes` · Outils : `ORDER BY`, `LIMIT`
*Affiche `numero_compte`, `type_compte` et `solde`.*

### Q3 — Quel est le total des soldes des comptes actifs ?
Tables : `comptes` · Outils : `SUM`, `WHERE`, alias (`AS total_soldes_actifs`)

### Q4 — Quels sont le solde moyen, minimum et maximum des comptes d'épargne ?
Tables : `comptes` · Outils : `AVG`, `MIN`, `MAX`, `WHERE`, alias
*Bonus : arrondis la moyenne avec `ROUND(..., 0)`.*

### Q5 — Quels comptes ont un solde inférieur à 100 000 FCFA ?
Tables : `comptes` · Outils : `WHERE`, `ORDER BY`, alias
*Trie du plus petit au plus grand solde.*

### Q6 — Dans quelles villes la banque a-t-elle au moins 2 clients ?
Tables : `clients` · Outils : `COUNT`, `GROUP BY`, `HAVING`, `ORDER BY`
*Affiche la ville et le nombre de clients, du plus grand au plus petit.*

### Q7 — Quel est le montant total des dépôts par canal (Agence, Mobile Money, Application mobile…) ?
Tables : `transactions` · Outils : `SUM`, `WHERE`, `GROUP BY`, `ORDER BY`
*Filtre d'abord sur `type_transaction = 'Dépôt'`.*

### Q8 — Quels sont les 3 plus gros retraits effectués ?
Tables : `transactions` · Outils : `WHERE`, `ORDER BY`, `LIMIT`
*Affiche le montant, la date et la description.*

### Q9 — Pour chaque statut de prêt : combien de prêts, quel montant total accordé et quel taux moyen ? Ne garde que les statuts ayant au moins 3 prêts.
Tables : `prets` · Outils : `COUNT`, `SUM`, `AVG`, `GROUP BY`, `HAVING`, alias

### Q10 — Parmi les prêts de plus de 2 000 000 FCFA et de plus de 24 mois, quels sont les 3 avec le taux d'intérêt le plus bas ?
Tables : `prets` · Outils : `WHERE ... AND ...`, `ORDER BY`, `LIMIT`
*Affiche `id_pret`, `montant_accorde`, `taux_interet`, `duree_mois`, `objet`.*

---

## Fichier de réponses à compléter

```sql
-- Q1 : ...
SELECT ...;

-- Q2 : ...
SELECT ...;
```
