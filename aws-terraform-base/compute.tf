# ── Ressources de calcul (EC2, Key Pairs) ──
# Ce fichier utilise le module EC2

resource "random_id" "suffix" {
  byte_length = var.random_suffix_length
}

module "ec2" {
  source = "./modules/ec2"

  project_name              = var.project_name
  ami_id                    = data.aws_ami.ubuntu.id
  instance_type             = var.instance_type
  subnet_id                 = module.vpc.subnet_public_id
  security_group_id         = module.security_group.security_group_id
  public_key_path           = var.public_key_path
  root_volume_size          = var.root_volume_size
  root_volume_type          = var.root_volume_type
  root_volume_encrypted     = var.root_volume_encrypted
  common_tags               = local.common_tags
}
