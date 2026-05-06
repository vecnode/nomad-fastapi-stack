from fastapi import FastAPI

app = FastAPI(title="Nomad FastAPI Service", version="1.0.0")


@app.get("/")
def read_root() -> dict[str, str]:
    return {"message": "FastAPI running in Docker with Nomad"}


@app.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}
