job "fastapi-service" {
  datacenters = ["dc1"]
  type = "service"

  group "api" {
    network {
      mode = "host"

      port "http" {
        static = 8000
      }
    }

    task "fastapi" {
      driver = "docker"

      config {
        image = "nomad-fastapi:latest"
      }

      resources {
        cpu    = 500
        memory = 256
      }

      service {
        name = "fastapi"
        port = "http"

        check {
          type     = "http"
          path     = "/health"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
