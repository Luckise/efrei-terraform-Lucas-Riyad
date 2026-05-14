variable "project_name" {
  description = "Nom du projet"
  type        = string
}

variable "ami_id" {
  description = "ID de l'AMI à utiliser"
  type        = string
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t3.micro"

  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium", "t3.large"], var.instance_type)
    error_message = "Instance type non autorisée. Autorisées: t3.micro, t3.small, t3.medium, t3.large"
  }
}

variable "subnet_id" {
  description = "ID du subnet pour l'instance"
  type        = string
}

variable "security_group_id" {
  description = "ID du security group"
  type        = string
}

variable "public_key_path" {
  description = "Chemin vers la clé publique SSH"
  type        = string
}

variable "root_volume_size" {
  description = "Taille du volume racine (GB)"
  type        = number
  default     = 20

  validation {
    condition     = var.root_volume_size >= 8 && var.root_volume_size <= 100
    error_message = "La taille du volume doit être entre 8 et 100 GB"
  }
}

variable "root_volume_type" {
  description = "Type du volume racine"
  type        = string
  default     = "gp3"

  validation {
    condition     = contains(["gp2", "gp3", "io1"], var.root_volume_type)
    error_message = "Type de volume non autorisé. Autorisés: gp2, gp3, io1"
  }
}

variable "root_volume_encrypted" {
  description = "Chiffrer le volume racine"
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Tags communs à appliquer à toutes les ressources"
  type        = map(string)
  default     = {}
}
