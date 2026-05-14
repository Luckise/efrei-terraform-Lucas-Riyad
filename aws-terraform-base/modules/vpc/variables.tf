variable "project_name" {
  description = "Nom du projet"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR du VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR du subnet public"
  type        = string
}

variable "availability_zone" {
  description = "Zone de disponibilité pour le subnet"
  type        = string
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

variable "allow_all_cidr" {
  description = "CIDR block pour autoriser tout le trafic"
  type        = string
  default     = "0.0.0.0/0"
}

variable "common_tags" {
  description = "Tags communs à appliquer à toutes les ressources"
  type        = map(string)
  default     = {}
}
