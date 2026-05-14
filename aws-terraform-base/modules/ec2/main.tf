# ── Key Pair SSH ──────────────────────────────────
resource "aws_key_pair" "deployer" {
  key_name   = "${var.project_name}-key"
  public_key = file(var.public_key_path)

  tags = merge(
    var.common_tags,
    { Name = "${var.project_name}-key" }
  )
}

# ── EC2 Instance ───────────────────────────────────
resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = aws_key_pair.deployer.key_name

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    encrypted             = var.root_volume_encrypted
    delete_on_termination = true
  }

  tags = merge(
    var.common_tags,
    { Name = "${var.project_name}-web" }
  )

  depends_on = [aws_key_pair.deployer]
}
