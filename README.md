# TP DevOps Terraform & AWS

Projet Terraform pour le TP DevOps S8. Le dépôt est organisé en deux parties distinctes :

- une partie locale avec Docker et GitHub à la racine du projet
- une partie AWS plus structurée dans `aws-terraform-base/`

## Membres

- Lucas Riyad



## Structure du dépôt

### Partie locale : Docker + GitHub


- `main.tf` : déploiement Docker et gestion GitHub
- `variables.tf` : déclaration des variables
- `outputs.tf` : valeurs exportées
- `versions.tf` : versions Terraform et providers
- `terraform.tfvars` : valeurs locales de configuration

Cette partie permet de tester le workflow Terraform avec :

- un conteneur `nginx`
- un conteneur `redis`
- un réseau Docker
- un dépôt GitHub protégé
- un secret GitHub Actions

### Partie AWS : infrastructure de base

Le dossier `aws-terraform-base/` contient l'infrastructure AWS structurée et modularisée :

- `main.tf` : fichier d'orchestration
- `data.tf` : sources de données AWS
- `locals.tf` : tags et valeurs dérivées
- `networking.tf` : appel du module réseau
- `security.tf` : appel du module sécurité
- `compute.tf` : appel du module EC2
- `storage.tf` : appel du module S3
- `outputs.tf` : outputs principaux
- `variables.tf` : variables globales du projet
- `provider.tf` : configuration du provider AWS
- `versions.tf` : versions Terraform et providers
- `terraform.tfvars` : valeurs de l'environnement
- `modules/` : modules réutilisables `vpc`, `security_group`, `ec2`, `s3`


## Valeurs à renseigner

Le fichier `terraform.tfvars` sert à fournir les valeurs concrètes sans mélanger la configuration et les paramètres d'environnement.

Exemple pour la partie AWS :

```hcl
project_name      = "tp-terraform-Lucas_Riyad"
owner             = "lucas.guillemin@efrei.net"
environment       = "dev"
my_ip             = "X.X.X.X/32"
aws_region        = "eu-west-3"
vpc_cidr          = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
instance_type     = "t3.micro"
```


## Captures d'écran

Les images se trouve dans le Readme du dossier aws-terraform-base

