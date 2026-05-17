# ── S3 Bucket ──────────────────────────────────────
resource "aws_s3_bucket" "assets" {
  bucket = replace(lower("${var.project_name}-assets-${var.name_suffix}"), "_", "-")

  tags = merge(
    var.common_tags,
    { Name = replace(lower("${var.project_name}-assets"), "_", "-") }
  )
}

# ── S3 Bucket Versioning ──────────────────────────
resource "aws_s3_bucket_versioning" "assets" {
  bucket = aws_s3_bucket.assets.id

  versioning_configuration {
    status = var.s3_versioning_status
  }
}

# ── S3 Bucket Encryption ──────────────────────────
resource "aws_s3_bucket_server_side_encryption_configuration" "assets" {
  bucket = aws_s3_bucket.assets.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.s3_encryption_algorithm
    }
  }
}

# ── S3 Bucket Block Public Access ─────────────────
resource "aws_s3_bucket_public_access_block" "assets" {
  bucket = aws_s3_bucket.assets.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
