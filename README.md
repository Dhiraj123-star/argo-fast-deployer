# 🚀 Zero-Downtime FastAPI

A production-ready boilerplate for a **FastAPI** application, containerized with **Docker**, and optimized for **Zero-Downtime Deployments** using Kubernetes native Rolling Updates.

## 🛠 Tech Stack
* **Backend:** FastAPI (Python 3.11)
* **Containerization:** Docker
* **Local Orchestration:** Docker Compose
* **CI/CD:** GitHub Actions & Docker Hub
* **Orchestration:** Kubernetes (Minikube/Managed K8s)

---

## 📂 Project Structure
* `app/`: FastAPI source code (includes `/health` for readiness checks).
* `Dockerfile`: Optimized multi-stage build.
* `docker-compose.yml`: Local development environment (Port 8000).
* `k8s/`: Kubernetes manifests with **RollingUpdate** strategy.
* `.github/workflows/`: Automated CI/CD pipeline for Docker Hub.

---

## 🚀 Key Features Implemented

### 1. Zero-Downtime Strategy
The Kubernetes Deployment is configured with:
* **RollingUpdate:** Gradual replacement of pods to ensure availability.
* **maxSurge: 1**: Allows the cluster to spin up an extra pod before killing old ones.
* **Readiness Probes**: Kubernetes only sends traffic to pods once the `/health` endpoint returns a success status on port `8000`.



### 2. Automated CI/CD
* **GitHub Actions:** Every push to `main` triggers a build and pushes the image to `dhiraj918106/zero-downtime-api:latest`.

### 3. Resource Management
* Defined CPU/Memory **requests** and **limits** to ensure cluster stability.

---

## 🛠 How to Run

### 1. Local Development (Docker Only)
```bash
docker-compose up --build

```

Access the API at: `http://localhost:8000`

### 2. Kubernetes Deployment

Ensure Minikube is running, then apply the manifests:

```bash
kubectl apply -f k8s/manifests.yaml

```

### 3. Performing a Zero-Downtime Update

After pushing code and the GitHub Action finishes, trigger the update:

```bash
# 1. Force Kubernetes to pull the latest image and rotate pods
kubectl rollout restart deployment zero-downtime-api

# 2. Watch the transition in real-time
kubectl get pods -w

```

---

## 🔗 API Endpoints

* `GET /`: Returns system status and version.
* `GET /health`: Health check endpoint used by Kubernetes Readiness Probes.


