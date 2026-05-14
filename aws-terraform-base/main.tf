# ── Configuration principale du projet ────────────────
# Ce fichier orchestre les différents modules de l'infrastructure
# Les ressources spécifiques sont organisées dans:
# - data.tf : sources de données (AMI, zones disponibles)
# - locals.tf : valeurs locales et tags communs
# - networking.tf : infrastructure réseau via module VPC
# - security.tf : sécurité via module Security Group
# - compute.tf : calcul via module EC2
# - storage.tf : stockage via module S3
