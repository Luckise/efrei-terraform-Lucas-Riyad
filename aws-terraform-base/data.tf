# ── Data sources ───────────────────────────────────

# Récupérer les zones de disponibilité disponibles dans la région
data "aws_availability_zones" "available" {
  state = "available"
}

# Récupérer l'AMI Ubuntu la plus récente
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = [var.ubuntu_ami_owner]

  filter {
    name   = "image-id"
    values = [var.ubuntu_ami_filter]
  }
}
