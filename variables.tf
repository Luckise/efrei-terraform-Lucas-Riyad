variable "project_name" {
	description = "Nom du projet"
	type        = string
	default     = "tp-terraform"
}

variable "host_port" {
	description = "Port sur la machine hôte"
	type        = number
	default     = 8080
}

variable "web_image" {
	description = "Image utilisée pour le container web"
	type        = string
	default     = "nginx:alpine"
}

variable "redis_image" {
	description = "Image utilisée pour le container redis"
	type        = string
	default     = "redis:alpine"
}

variable "github_token" {
	description = "Chemin vers le fichier local contenant le Personal Access Token GitHub"
	type        = string
	sensitive   = true
	nullable    = false
}

variable "db_url" {
	description = "URL de base de données à injecter dans le secret GitHub Actions"
	type        = string
	sensitive   = true
	nullable    = false
}

variable "docker_network_name" {
	description = "Nom du réseau Docker"
	type        = string
	default     = "app-network"
}

variable "container_internal_port" {
	description = "Port interne du container web"
	type        = number
	default     = 80
}

variable "github_repo_description" {
	description = "Description du dépôt GitHub"
	type        = string
	default     = "Dépôt géré par Terraform - DevOps 4A"
}

variable "github_secret_name" {
	description = "Nom du secret GitHub Actions"
	type        = string
	default     = "DATABASE_URL"
}

variable "github_repo_has_issues" {
	description = "Activer les issues sur le dépôt"
	type        = bool
	default     = true
}

variable "github_repo_auto_init" {
	description = "Auto-initialiser le dépôt"
	type        = bool
	default     = true
}

variable "github_branch_protection_pattern" {
	description = "Pattern de branche à protéger"
	type        = string
	default     = "main"
}

variable "github_required_approvals" {
	description = "Nombre d'approbations requises"
	type        = number
	default     = 1
}

variable "github_dismiss_stale_reviews" {
	description = "Rejeter les reviews obsolètes"
	type        = bool
	default     = true
}


