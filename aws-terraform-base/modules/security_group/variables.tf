variable "project_name" {
  description = "Nom du projet"
  type        = string
}

variable "vpc_id" {
  description = "ID du VPC"
  type        = string
}

variable "my_ip" {
  description = "Votre IP publique pour autoriser SSH (format CIDR : x.x.x.x/32)"
  type        = string
}

variable "sg_description" {
  description = "Description du security group web"
  type        = string
  default     = "Security Group pour le serveur web"
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
