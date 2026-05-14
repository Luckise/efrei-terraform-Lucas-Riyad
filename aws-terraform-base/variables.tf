variable "aws_region" {
  description = "Région AWS cible"
  type        = string
  default     = "eu-west-3"
}

variable "project_name" {
  description = "Nom du projet (utilisé dans les tags et noms de ressources)"
  type        = string
}

variable "environment" {
  description = "Environnement (dev, staging, prod)"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "L'environnement doit être dev, staging ou prod."
  }
}

variable "owner" {
  description = "Nom ou email du responsable"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR du subnet public"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t3.micro"
}

variable "my_ip" {
  description = "Votre IP publique pour autoriser SSH (format CIDR : x.x.x.x/32)"
  type        = string
  default     = "159.117.224.21"
}

variable "public_key_path" {
  description = "Chemin vers la clé publique SSH"
  type        = string
  default     = "/home/lucas/.ssh/tp_terraform.pub"
}

variable "ubuntu_ami_owner" {
  description = "Owner ID pour l'AMI Ubuntu"
  type        = string
  default     = "099720109477"
}

variable "ubuntu_ami_filter" {
  description = "Image ID à filtrer pour l'AMI Ubuntu"
  type        = string
  default     = "ami-0adb8ca49015e0901"
}

variable "random_suffix_length" {
  description = "Longueur du suffix aléatoire en bytes"
  type        = number
  default     = 4
}

variable "enable_dns_hostnames" {
  description = "Activer les hostnames DNS dans le VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Activer le support DNS dans le VPC"
  type        = bool
  default     = true
}

variable "s3_versioning_status" {
  description = "Statut du versioning S3"
  type        = string
  default     = "Enabled"
}

variable "s3_encryption_algorithm" {
  description = "Algorithme de chiffrement S3"
  type        = string
  default     = "AES256"
}

variable "ssh_port" {
  description = "Port SSH"
  type        = number
  default     = 22
}

variable "http_port" {
  description = "Port HTTP"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "Port HTTPS"
  type        = number
  default     = 443
}

variable "allow_all_cidr" {
  description = "CIDR block pour autoriser tout le trafic"
  type        = string
  default     = "0.0.0.0/0"
}

variable "root_volume_size" {
  description = "Taille du volume racine (GB)"
  type        = number
  default     = 20
}

variable "root_volume_type" {
  description = "Type du volume racine"
  type        = string
  default     = "gp3"
}

variable "root_volume_encrypted" {
  description = "Chiffrer le volume racine"
  type        = bool
  default     = true
}

variable "sg_ssh_description" {
  description = "Description de la règle SSH du security group"
  type        = string
  default     = "SSH depuis ma machine"
}

variable "sg_http_description" {
  description = "Description de la règle HTTP du security group"
  type        = string
  default     = "HTTP public"
}

variable "sg_https_description" {
  description = "Description de la règle HTTPS du security group"
  type        = string
  default     = "HTTPS public"
}

variable "sg_egress_description" {
  description = "Description de la règle de sortie du security group"
  type        = string
  default     = "Tout le trafic sortant"
}

variable "sg_web_description" {
  description = "Description du security group web"
  type        = string
  default     = "Security Group pour le serveur web"
}
