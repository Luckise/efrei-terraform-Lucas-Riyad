# ── Variables locales et valeurs dérivées ───────────

locals {
  # Tags communs appliqués à toutes les ressources
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = var.owner
  }

  # Suffixe aléatoire pour garantir l'unicité des noms de ressources
  name_suffix = random_id.suffix.hex
}
