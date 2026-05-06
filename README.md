# nomad-fastapi-stack

Run with Docker:
docker compose up --build
curl http://localhost:8000/
curl http://localhost:8000/health
docker compose down

Run with Nomad locally:
nomad agent -dev
docker build -t nomad-fastapi:latest .
nomad job run nomad/fastapi.nomad.hcl
nomad job status fastapi-service
curl http://localhost:8000/health
nomad job stop fastapi-service
