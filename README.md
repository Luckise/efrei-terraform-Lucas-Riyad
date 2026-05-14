# TP DevOps Terraform & AWS

Projet Terraform pour le TP DevOps S8. Le dépôt est organisé en deux parties distinctes :

- une partie locale avec Docker et GitHub à la racine du projet
- une partie AWS plus structurée dans `aws-terraform-base/`

## Membres

- Lucas Riyad



## Structure du dépôt

### Partie locale : Docker + GitHub

À la racine du dépôt, on retrouve la partie d'exercice sur les providers gratuits :

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

## Déploiement de la partie locale

```bash
terraform init
terraform plan
terraform apply
```

Puis vérifier le conteneur web :

```bash
curl http://localhost:8080
```

Outputs utiles :

```bash
terraform output
terraform output url
```

## Gestion des secrets

Deux éléments doivent rester hors du dépôt Git :

- le fichier local `GitHub_Token` qui contient le Personal Access Token GitHub
- la valeur `db_url`, à placer dans un fichier local `secrets.auto.tfvars`

### 1. Récupérer le token GitHub

Le token se crée dans GitHub :

`GitHub` → `Settings` → `Developer settings` → `Personal access tokens` → `Fine-grained tokens` → `Generate new token`

Le token doit ensuite être copié dans un fichier local nommé `GitHub_Token` à la racine du dépôt. Le fichier est ignoré par Git.

### 2. Renseigner la base de données utilisée pour le secret `DATABASE_URL`

La variable `db_url` correspond à l'URL de connexion que vous voulez exposer à GitHub Actions. Vous pouvez la récupérer depuis :

- votre base de données locale
- un service managé que vous utilisez pour le TP
- une chaîne de connexion de test si vous validez seulement la partie Terraform

Si vous avez une vraie URL de connexion, placez-la dans un fichier local `secrets.auto.tfvars` à la racine du dépôt, par exemple :

```hcl
db_url = "postgresql://user:pass@localhost/mydb"
```

Ce fichier est ignoré par Git et ne doit pas être versionné.

### 3. Appliquer avec les secrets

```bash
terraform apply
```

Terraform lira automatiquement le fichier `GitHub_Token` via la variable `github_token` et la valeur `db_url` depuis `secrets.auto.tfvars` si vous l'avez créé.

## Déploiement de la partie AWS

Se placer dans le dossier AWS :

```bash
cd aws-terraform-base
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

## Valeurs à renseigner

Le fichier `terraform.tfvars` sert à fournir les valeurs concrètes sans mélanger la configuration et les paramètres d'environnement.

Exemple pour la partie AWS :

```hcl
project_name      = "tp-terraform-votreprenom"
owner             = "prenom.nom@efrei.fr"
environment       = "dev"
my_ip             = "X.X.X.X/32"
aws_region        = "eu-west-3"
vpc_cidr          = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
instance_type     = "t3.micro"
```


## Captures à ajouter au rendu

Le TP demande normalement d'ajouter dans le README ou dans le dépôt :

- une capture ou un log d'un `terraform apply` réussi
- une capture de la connexion SSH à l'EC2
- éventuellement une capture des ressources AWS dans la console

Les images peuvent être ajoutées ensuite si nécessaire.

## Bonus implémentés ou en cours

- Modularisation de l'infrastructure AWS dans `aws-terraform-base/modules/`
- Séparation des fichiers d'organisation avec `data.tf`, `locals.tf`, `networking.tf`, `security.tf`, `compute.tf` et `storage.tf`
- Ajout de validations sur plusieurs variables côté AWS
- Protection publique du bucket S3 via `aws_s3_bucket_public_access_block`


## Destruction

À la fin des tests, tout détruire :

```bash
terraform destroy
```

Sur AWS, vérifier que les ressources principales ont bien disparu : EC2, VPC, S3 et autres ressources créées par le projet.
