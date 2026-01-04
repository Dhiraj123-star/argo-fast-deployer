
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

* **RollingUpdate:** Replaces pods one-by-one.
* **maxUnavailable: 0**: Ensures the service never loses capacity during a deployment.
* **Readiness Probes**: Kubernetes only sends traffic to new pods once the FastAPI server confirms it is "Ready" via the `/health` endpoint.

### 2. Automated CI/CD

* **GitHub Actions:** On every push to `main`, the image is automatically built and pushed to `dhiraj918106/argo-fast-deployer:latest`.

### 3. Resource Management

* Defined CPU/Memory **requests** and **limits** to ensure cluster stability and prevent container OOM (Out Of Memory) kills.

---

## 🛠 How to Run

### 1. Local Development (Docker Only)

To test the app quickly without Kubernetes:

```bash
docker-compose up --build

```

Access the API at: `http://localhost:8000`

### 2. Kubernetes Deployment (Initial)

Ensure your Minikube is running, then apply the manifests:

```bash
kubectl apply -f k8s/manifests.yaml

```

### 3. Performing a Zero-Downtime Update

When you push new code and the GitHub Action finishes, trigger the update manually:

```bash
# 1. Update the pods with the new image
kubectl rollout restart deployment argofast-api

# 2. Watch the pods transition (Zero-Downtime in action)
kubectl get pods -w

```

---

## 🔗 API Endpoints

* `GET /`: Returns system status and version.
* `GET /health`: Health check endpoint used by Kubernetes Readiness Probes.

---
