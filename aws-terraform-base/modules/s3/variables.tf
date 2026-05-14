variable "project_name" {
  description = "Nom du projet"
  type        = string
}

variable "name_suffix" {
  description = "Suffixe unique pour le bucket"
  type        = string
}

variable "s3_versioning_status" {
  description = "Statut du versioning S3"
  type        = string
  default     = "Enabled"

  validation {
    condition     = contains(["Enabled", "Suspended"], var.s3_versioning_status)
    error_message = "Status du versioning doit être 'Enabled' ou 'Suspended'"
  }
}

variable "s3_encryption_algorithm" {
  description = "Algorithme de chiffrement S3"
  type        = string
  default     = "AES256"

  validation {
    condition     = contains(["AES256", "aws:kms"], var.s3_encryption_algorithm)
    error_message = "Algorithme d'encryption doit être 'AES256' ou 'aws:kms'"
  }
}

variable "common_tags" {
  description = "Tags communs à appliquer à toutes les ressources"
  type        = map(string)
  default     = {}
}
