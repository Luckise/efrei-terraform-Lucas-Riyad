# ── AWS Region ─────────────────────────────────────
output "aws_region" {
  description = "Region configured for the AWS provider."
  value       = var.aws_region
}

# ── VPC Outputs ─────────────────────────────────────
output "vpc_id" {
  description = "ID du VPC créé"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "CIDR du VPC"
  value       = module.vpc.vpc_cidr
}

output "subnet_public_id" {
  description = "ID du subnet public"
  value       = module.vpc.subnet_public_id
}

output "internet_gateway_id" {
  description = "ID du Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

# ── Security Group Outputs ──────────────────────────
output "security_group_id" {
  description = "ID du security group web"
  value       = module.security_group.security_group_id
}

output "security_group_name" {
  description = "Nom du security group web"
  value       = module.security_group.security_group_name
}

# ── EC2 Outputs ─────────────────────────────────────
output "instance_id" {
  description = "ID de l'instance EC2"
  value       = module.ec2.instance_id
}

output "instance_public_ip" {
  description = "IP publique de l'instance EC2"
  value       = module.ec2.instance_public_ip
}

output "instance_public_dns" {
  description = "DNS public de l'instance EC2"
  value       = module.ec2.instance_public_dns
}

output "ssh_command" {
  description = "Commande SSH pour se connecter"
  value       = module.ec2.ssh_command
}

output "key_pair_name" {
  description = "Nom de la key pair SSH"
  value       = module.ec2.key_pair_name
}

# ── S3 Outputs ──────────────────────────────────────
output "s3_bucket_id" {
  description = "ID du bucket S3 assets"
  value       = module.s3.bucket_id
}

output "s3_bucket_arn" {
  description = "ARN du bucket S3 assets"
  value       = module.s3.bucket_arn
}

output "s3_bucket_region" {
  description = "Région du bucket S3"
  value       = module.s3.bucket_region
}

output "s3_versioning_enabled" {
  description = "Statut du versioning du bucket S3"
  value       = module.s3.bucket_versioning_enabled
}
