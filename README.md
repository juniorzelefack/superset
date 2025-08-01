# Superset Dashboards – Suivi des Indicateurs

## Objectif

Ce projet a pour objectif de visualiser les indicateurs clés liés aux activités de l’IAT à l’aide d’Apache Superset. Il centralise les données et facilite leur lecture sous forme de tableaux de bord interactifs pour soutenir l’analyse et la prise de décision.

## Indicateurs suivis

- Indicateurs sur les candidatures :
  - Volume de candidatures
  - Répartition par filière, genre, niveau

- Indicateurs sur les réussites à l’IAT :
  - Taux de réussite par année
  - Comparaison par école et filière

- Indicateurs sur les abandons :
  - Nombre et taux d’abandon
  - Répartition par motif et période

- Indicateurs par école :
  - Performances comparées
  - Effectifs, taux d’abandon et de réussite

- Indicateurs sur les visites du site web :
  - Nombre de visites
  - Provenance géographique
  - Pages les plus consultées

## Technologies utilisées

- Apache Superset
- Docker / Docker Compose
- PostgreSQL, CSV, Google Analytics
- Git

## Installation

executer le fichier bash_init.sh avec linux 

```bash
chmod +x install_superset.sh
./install_superset.sh

# et powershell_init.ps1 avec powershell windows

```powershell
.\install_superset.ps1
