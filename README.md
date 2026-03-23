---
title: "Wordpress-Creation-Script-with-Docker"
shortDescription: "A Bash automation script that spins up a full WordPress site using the LEMP stack (Linux, Nginx, MySQL, PHP) via Docker Compose — with support for creating, enabling, disabling, and deleting sites."
repoURL: "https://github.com/AnanthuAnil13/Wordpress-Creation-Script-with-Docker"
liveURL: ""
imageURL: ""
technologies:
  - Bash / Shell Script
  - Docker
  - Docker Compose
  - Nginx
  - MySQL
  - PHP
  - WordPress
category: "DevOps / Automation"
featured: true
order: 4
status: "Completed"
year: 2022
platform: "Linux (Debian-based)"
visibility: "public"
---

# Wordpress-Creation-Script-with-Docker

> Automate WordPress site creation with a single Bash command — powered by Docker and the LEMP stack.

---

## 📌 Short Description

This project provides a single Bash script (`docword-sct.sh`) that fully automates the provisioning of a WordPress site using Docker Compose. It sets up the complete **LEMP stack** (Linux, Nginx, MySQL, PHP) in containers, updates `/etc/hosts` for local domain resolution, and exposes commands to **create**, **enable**, **disable**, and **delete** WordPress sites — all from the command line.

---

## 🔗 Links

| Resource   | URL |
|------------|-----|
| Repository | https://github.com/AnanthuAnil13/Wordpress-Creation-Script-with-Docker |

---

## 🛠️ Technologies Used

| Technology      | Role                                  |
|-----------------|---------------------------------------|
| Bash            | Automation scripting                  |
| Docker          | Container runtime                     |
| Docker Compose  | Multi-container orchestration         |
| Nginx           | Web server / reverse proxy            |
| MySQL           | Database server                       |
| PHP             | WordPress runtime                     |
| WordPress       | CMS being deployed                    |

---

## 📁 Project Structure

```
Wordpress-Creation-Script-with-Docker/
├── docword-sct.sh      # Main automation script
├── README.md           # Documentation
└── LICENSE             # License file
```

---

## ⚙️ Features

- **Auto-installs Docker & Docker Compose** if not already present on the system
- **Creates a WordPress site** with a custom domain name in one command
- **Adds a `/etc/hosts` entry** so the site is accessible via the given domain locally
- **Prompts to open the site** in a browser automatically after creation
- **Enable / Disable** sites (start/stop containers without deleting data)
- **Delete sites** and clean up all associated Docker containers and volumes
- **Debug-friendly** — view container logs with `docker-compose logs`

---

## 🚀 Getting Started

### Prerequisites

- A **Debian-based Linux** system (Ubuntu, Debian, etc.)
- `sudo` / root access
- Internet connection (for Docker installation if needed)

> Docker and Docker Compose will be installed automatically by the script if missing.

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/AnanthuAnil13/Wordpress-Creation-Script-with-Docker.git

# 2. Navigate into the directory
cd Wordpress-Creation-Script-with-Docker

# 3. Make the script executable
chmod +x docword-sct.sh
```

---

## 📖 Usage

### Create a New WordPress Site

```bash
sudo bash docword-sct.sh example.com
```

This will:
- Create all necessary Docker containers (Nginx, MySQL, PHP, WordPress)
- Add `example.com` to `/etc/hosts` pointing to `127.0.0.1`
- Prompt you to open the site in a browser

### Enable a Site

```bash
sudo bash docword-sct.sh example.com enable
```

Starts the containers for the site (if previously stopped).

### Disable a Site

```bash
sudo bash docword-sct.sh example.com disable
```

Stops the containers without removing data.

### Delete a Site

```bash
sudo bash docword-sct.sh example.com delete
```

Removes all containers and associated volumes for the site.

---

## 🐛 Troubleshooting

**View logs for all containers:**
```bash
docker-compose logs
```

**View logs for a specific container (e.g., MySQL):**
```bash
docker-compose logs db
```

**Check if containers are running:**
```bash
docker ps
```

---

## 📋 Metadata

| Field      | Value |
|------------|-------|
| Category   | DevOps / Automation |
| Platform   | Linux (Debian-based) |
| Status     | Completed |
| Year       | 2022 |
| Featured   | Yes |
| Visibility | Public |

---

## 📄 License

This project is licensed — see the [LICENSE](https://github.com/AnanthuAnil13/Wordpress-Creation-Script-with-Docker/blob/main/LICENSE) file for details.

---

## 👤 Author

**AnanthuAnil13**
GitHub: [@AnanthuAnil13](https://github.com/AnanthuAnil13)
