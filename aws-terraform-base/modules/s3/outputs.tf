output "bucket_id" {
  description = "ID du bucket S3"
  value       = aws_s3_bucket.assets.id
}

output "bucket_arn" {
  description = "ARN du bucket S3"
  value       = aws_s3_bucket.assets.arn
}

output "bucket_region" {
  description = "Région du bucket S3"
  value       = aws_s3_bucket.assets.region
}

output "bucket_versioning_enabled" {
  description = "Statut du versioning du bucket"
  value       = aws_s3_bucket_versioning.assets.versioning_configuration[0].status == "Enabled"
}
