# ── Ressources de networking (VPC, Subnets, IGW) ──
# Ce fichier utilise le module VPC pour créer toute l'infrastructure réseau

module "vpc" {
  source = "./modules/vpc"

  project_name           = var.project_name
  vpc_cidr               = var.vpc_cidr
  public_subnet_cidr     = var.public_subnet_cidr
  availability_zone      = data.aws_availability_zones.available.names[0]
  enable_dns_hostnames   = var.enable_dns_hostnames
  enable_dns_support     = var.enable_dns_support
  allow_all_cidr         = var.allow_all_cidr
  common_tags            = local.common_tags
}
