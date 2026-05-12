resource "docker_image" "nginx" {
		name = var.web_image
}

resource "docker_image" "redis" {
	name = var.redis_image
}

resource "docker_network" "app" {
	name = "app-network"
}

resource "docker_container" "web" {
	name  = "${var.project_name}-web"
	image = docker_image.nginx.image_id

	ports {
		internal = 80
		external = var.host_port
	}

	networks_advanced {
		name = docker_network.app.name
	}
}

resource "docker_container" "redis" {
	name  = "${var.project_name}-redis"
	image = docker_image.redis.image_id

	networks_advanced {
		name = docker_network.app.name
	}
}

resource "github_repository" "app" {
	name        = "${var.project_name}-demo"
	description = "Dépôt géré par Terraform - DevOps 4A"
	visibility  = "public"
	has_issues  = true
	auto_init   = true
}

resource "github_branch_protection" "main" {
	repository_id = github_repository.app.node_id
	pattern       = "main"

	required_pull_request_reviews {
		required_approving_review_count = 1
		dismiss_stale_reviews           = true
	}
}

resource "github_actions_secret" "db_url" {
	repository  = github_repository.app.name
	secret_name = "DATABASE_URL"
	plaintext_value = var.db_url
}


