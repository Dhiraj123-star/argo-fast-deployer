
# 🚀 ArgoFast-Deployer

A production-ready boilerplate for a **FastAPI** application, containerized with **Docker**, and prepared for GitOps-style deployment using **ArgoCD**.

## 🛠 Tech Stack

* **Backend:** FastAPI (Python 3.11)
* **Containerization:** Docker
* **Local Orchestration:** Docker Compose
* **Continuous Deployment:** ArgoCD (GitOps)
* **Orchestration:** Kubernetes

---

## 📂 Project Structure

* `app/`: Contains the FastAPI source code and logic.
* `Dockerfile`: Build instructions for the application image.
* `docker-compose.yml`: Local development setup for quick testing.
* `k8s/`: Kubernetes manifests (Deployment & Service) monitored by ArgoCD.

---

## 🚀 Recently Implemented

### 1. FastAPI Application

* Initialized a lightweight REST API.
* Created a health-check root endpoint (`/`) returning system status and version.
* Managed dependencies via `requirements.txt`.

### 2. Docker Integration

* **Dockerfile:** Multi-layer build to optimize image size using `python-slim`.
* **Docker Compose:** Set up a local environment mapping port `8000` to the container's port `80` for easy local debugging.

### 3. Kubernetes Manifests

* **Deployment:** Defined a scalable deployment (2 replicas) with resource labels.
* **Service:** Configured a `LoadBalancer` service to expose the FastAPI app to external traffic.

### 4. ArgoCD Readiness

* Organized the repository structure so ArgoCD can track the `/k8s` directory for automatic synchronization (GitOps).

---

## 🛠 How to Run

### Local Development

To start the app locally without Kubernetes:

```bash
docker-compose up --build

```

Access the API at: `http://localhost:8000`

### Deployment (GitOps)

1. Push this repository to GitHub.
2. Update the image name in `k8s/manifests.yaml` to your Docker Hub image.
3. Connect the repository to **ArgoCD** and point it to the `k8s/` path.

---
