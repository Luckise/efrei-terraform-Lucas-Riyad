resource "docker_image" "nginx" {
		name = var.web_image
}

resource "docker_image" "redis" {
	name = var.redis_image
}

resource "docker_network" "app" {
	name = var.docker_network_name
}

resource "docker_container" "web" {
	name  = "${var.project_name}-web"
	image = docker_image.nginx.image_id

	ports {
		internal = var.container_internal_port
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
	description = var.github_repo_description
	visibility  = "public"
	has_issues  = var.github_repo_has_issues
	auto_init   = var.github_repo_auto_init
}

resource "github_branch_protection" "main" {
	repository_id = github_repository.app.node_id
	pattern       = var.github_branch_protection_pattern

	required_pull_request_reviews {
		required_approving_review_count = var.github_required_approvals
		dismiss_stale_reviews           = var.github_dismiss_stale_reviews
	}
}

resource "github_actions_secret" "db_url" {
	repository  = github_repository.app.name
	secret_name = var.github_secret_name
	plaintext_value = var.db_url
}


