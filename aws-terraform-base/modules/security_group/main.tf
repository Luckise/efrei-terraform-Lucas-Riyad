# ── Security Group ────────────────────────────────
resource "aws_security_group" "web" {
  name        = "${var.project_name}-web-sg"
  description = var.sg_description
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
    description = var.sg_ssh_description
  }

  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = [var.allow_all_cidr]
    description = var.sg_http_description
  }

  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = [var.allow_all_cidr]
    description = var.sg_https_description
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.allow_all_cidr]
    description = var.sg_egress_description
  }

  tags = merge(
    var.common_tags,
    { Name = "${var.project_name}-web-sg" }
  )

  lifecycle {
    create_before_destroy = true
  }
}
