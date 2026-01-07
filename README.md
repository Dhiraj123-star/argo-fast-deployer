
# 🚀 Zero-Downtime FastAPI

A production-ready boilerplate for a **FastAPI** application, containerized with **Docker**, and optimized for **Zero-Downtime Deployments** using Kubernetes native Rolling Updates and Traefik Ingress.

## 🛠 Tech Stack

* **Backend:** FastAPI (Python 3.11)
* **Ingress Controller:** Traefik
* **Security:** SSL/TLS (Self-Signed Certificates)
* **Containerization:** Docker
* **CI/CD:** GitHub Actions & Docker Hub
* **Orchestration:** Kubernetes (Minikube/Managed K8s)

---

## 📂 Project Structure

* `app/`: FastAPI source code (includes `/health` for readiness checks).
* `k8s/manifests.yaml`: Core Deployment and Service definitions.
* `k8s/traefik-config.yaml`: Ingress rules and TLS termination settings.
* `.github/workflows/`: Automated CI/CD pipeline for Docker Hub.
* `test-rollout.sh`: Script to verify zero-downtime during updates.

---

## 🚀 Key Features Implemented

### 1. Zero-Downtime Strategy

* **RollingUpdate:** Replaces pods gradually ensuring 100% availability.
* **Readiness Probes:** Traefik only routes traffic to pods once the FastAPI `/health` check passes.

### 2. Modern Ingress with Traefik

* **HTTPS/TLS:** Secured communication using a Kubernetes TLS Secret.
* **Host-based Routing:** Traffic is routed via `https://fastapi.local`.
* **Traefik Dashboard:** Visual monitoring of routers, services, and entrypoints.

### 3. Automated CI/CD

* **GitHub Actions:** Every push to `main` triggers an automated build and push to `dhiraj918106/zero-downtime-api:latest`.

---

## 🛠 How to Run

### 1. Generate SSL Certificates

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout tls.key -out tls.crt \
  -subj "/CN=fastapi.local"

kubectl create secret tls fastapi-tls-secret --cert=tls.crt --key=tls.key

```

### 2. Deploy to Kubernetes

```bash
# Apply standard manifests
kubectl apply -f k8s/manifests.yaml

# Apply Traefik Ingress configuration
kubectl apply -f k8s/traefik-config.yaml

```

### 3. Accessing the Application

1. Start the Minikube tunnel: `minikube tunnel`
2. Map the domain in `/etc/hosts`: `127.0.0.1 fastapi.local`
3. Visit: `https://fastapi.local`

---

## 🔗 API Endpoints

* `GET /`: Returns system status and version.
* `GET /status`: Detailed system health and uptime (added via feature branch).
* `GET /health`: Kubernetes Liveness/Readiness probe endpoint.

---
