# ── Ressources de sécurité (Security Groups, règles) ──
# Ce fichier utilise le module Security Group

module "security_group" {
  source = "./modules/security_group"

  project_name              = var.project_name
  vpc_id                    = module.vpc.vpc_id
  my_ip                     = var.my_ip
  sg_description            = var.sg_web_description
  ssh_port                  = var.ssh_port
  http_port                 = var.http_port
  https_port                = var.https_port
  sg_ssh_description        = var.sg_ssh_description
  sg_http_description       = var.sg_http_description
  sg_https_description      = var.sg_https_description
  sg_egress_description     = var.sg_egress_description
  allow_all_cidr            = var.allow_all_cidr
  common_tags               = local.common_tags
}
