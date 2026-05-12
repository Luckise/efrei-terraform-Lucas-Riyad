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


