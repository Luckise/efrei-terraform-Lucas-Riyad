terraform {
	required_version = ">= 1.6"

	required_providers {
		docker = {
			source  = "kreuzwerker/docker"
			version = "~> 3.0"
		}
		github = {
			source  = "integrations/github"
			version = "~> 6.0"
		}
	}
}

provider "docker" {}

provider "github" {
	token = trimspace(file(var.github_token))
}

