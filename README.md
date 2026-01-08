
# 🚀 Zero-Downtime FastAPI

A production-ready boilerplate for a **FastAPI** application, containerized with **Docker**, and optimized for **Zero-Downtime Deployments** using Kubernetes native Rolling Updates and Traefik Ingress.

## 🛠 Tech Stack

* **Backend:** FastAPI (Python 3.11)
* **Ingress Controller:** Traefik
* **Security:** SSL/TLS & Automated HTTPS Redirection
* **Containerization:** Docker
* **Orchestration:** Kubernetes (Minikube/Managed K8s)

---

## 📂 Project Structure

* `app/`: FastAPI source code.
* `k8s/manifests.yaml`: Core Deployment, Service, and Probe definitions.
* `k8s/traefik-config.yaml`: Ingress rules and TLS settings.
* `k8s/traefik-middleware.yaml`: HTTPS redirection logic.
* `k8s/configmap.yaml`: Centralized application configuration.

---

## 🚀 Key Features Implemented

### 1. Self-Healing & Availability

* **RollingUpdate:** Zero-downtime pod rotation.
* **Readiness Probes:** Ensures pods are ready before receiving traffic.
* **Liveness Probes:** Automatically restarts unhealthy containers.

### 2. Modern Ingress & Security

* **Traefik Ingress:** Managed traffic routing with SSL termination.
* **HTTPS Redirection:** Middleware-driven 301 redirects from port 80 to 443.

### 3. Decoupled Configuration

* **ConfigMaps:** Environment-specific variables (APP_ENV, LOG_LEVEL) are injected at runtime, keeping the Docker image generic and portable.

---

## 🛠 How to Run

### 1. Setup Secrets & Config

```bash
# Generate SSL Secret
kubectl create secret tls fastapi-tls-secret --cert=tls.crt --key=tls.key

# Apply Configuration
kubectl apply -f k8s/configmap.yaml

```

### 2. Deploy

```bash
kubectl apply -f k8s/manifests.yaml
kubectl apply -f k8s/traefik-middleware.yaml
kubectl apply -f k8s/traefik-config.yaml

```

### 3. Verify Environment Variables

```bash
kubectl exec <pod-name> -- env | grep APP_

```

---

## 🔗 API Endpoints

* `GET /`: System status.
* `GET /health`: Health check endpoint (Liveness/Readiness).

---
