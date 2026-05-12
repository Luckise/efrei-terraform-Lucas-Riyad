output "container_name" {
	value = docker_container.web.name
}

output "url" {
	value = "http://localhost:${docker_container.web.ports[0].external}"
}

output "redis_container_name" {
	value = docker_container.redis.name
}

output "github_repository_url" {
	value = github_repository.app.html_url
}

output "github_repository_name" {
	value = github_repository.app.name
}


