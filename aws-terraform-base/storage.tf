# ── Ressources de stockage (S3, EBS) ──
# Ce fichier utilise le module S3

module "s3" {
  source = "./modules/s3"

  project_name             = var.project_name
  name_suffix              = local.name_suffix
  s3_versioning_status     = var.s3_versioning_status
  s3_encryption_algorithm  = var.s3_encryption_algorithm
  common_tags              = local.common_tags
}
