output "security_group_id" {
  description = "ID du security group web"
  value       = aws_security_group.web.id
}

output "security_group_name" {
  description = "Nom du security group web"
  value       = aws_security_group.web.name
}
