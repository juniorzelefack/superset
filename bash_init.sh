#!/bin/bash

set -e  # Stoppe le script en cas d'erreur

echo "Vérification des prérequis..."

# Vérifier si Git est installé
if ! command -v git &> /dev/null; then
    echo "Git n'est pas installé. Installez-le avec : sudo apt install git"
    exit 1
fi

# Vérifier si Docker est installé
if ! command -v docker &> /dev/null; then
    echo "Docker n'est pas installé. Installez-le avec : https://docs.docker.com/engine/install/"
    exit 1
fi

# Vérifier si Docker Compose est installé
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose n'est pas installé. Installez-le avec : sudo apt install docker-compose"
    exit 1
fi

# Cloner le dépôt officiel d'Apache Superset
echo "Clonage du dépôt Superset..."
git clone https://github.com/apache/superset.git
cd superset

# Passer au dossier docker
cd docker

echo "Lancement de l'installation avec docker-compose..."

# Lancer les conteneurs en arrière-plan
docker-compose -f docker-compose-non-dev.yml up -d

# Attendre que les services soient prêts
echo "Attente de l'initialisation (10 secondes)..."
sleep 10

echo "Initialisation de la base de données Superset..."

# Initialiser la base et créer l'utilisateur admin
docker exec -it superset_app superset fab create-admin \
   --username admin \
   --firstname Superset \
   --lastname Admin \
   --email admin@superset.com \
   --password admin123

docker exec -it superset_app superset db upgrade
docker exec -it superset_app superset init

echo "Superset est installé et en cours d'exécution."
echo "Accédez à http://localhost:8088 avec les identifiants : admin / password: admin123"
