
Write-Host "Vérification des prérequis..."

# Vérification de Git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git n'est pas installé. Installez-le depuis https://git-scm.com/download/win"
    exit 1
}

# Vérification de Docker
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker n'est pas installé. Installez Docker Desktop : https://www.docker.com/products/docker-desktop/"
    exit 1
}

# Clonage du dépôt Superset
Write-Host "Clonage du dépôt Apache Superset..."
git clone https://github.com/apache/superset.git
Set-Location -Path ".\superset\docker"

# Lancement avec docker-compose
Write-Host "Lancement de Superset avec Docker..."
docker compose -f docker-compose-non-dev.yml up -d

# Pause pour laisser les conteneurs démarrer
Write-Host "Attente de 20 secondes pour l'initialisation..."
Start-Sleep -Seconds 20

# Création de l'utilisateur admin et initialisation
Write-Host "Création de l'utilisateur admin..."
docker exec -it superset_app superset fab create-admin `
    --username admin `
    --firstname Superset `
    --lastname Admin `
    --email admin@superset.com `
    --password admin123

Write-Host "Initialisation de la base de données..."
docker exec -it superset_app superset db upgrade
docker exec -it superset_app superset init

Write-Host "Superset est installé avec succès !"
Write-Host "Rendez-vous sur http://localhost:8088 (login: admin / password: admin123)"
