Linux Server Automation with Docker Deployment

Overview

This project provides an automated Bash script for provisioning a Linux server.
The script installs essential DevOps tools, configures system security, deploys a Docker container, and performs system health checks.

The goal of this project is to demonstrate practical Linux automation and infrastructure provisioning skills commonly used in DevOps environments.

---

Features

- Automated system update and upgrade
- Installation of essential DevOps tools
- Docker installation and configuration
- Automated container deployment
- Firewall configuration
- Security hardening with Fail2Ban
- Creation of a dedicated DevOps user
- Container health verification
- System resource monitoring

---

Technologies Used

- Linux (Ubuntu)
- Bash Scripting
- Docker
- Nginx
- UFW Firewall
- Fail2Ban

---

Project Structure

linux-server-automation
│
├── setup_server.sh
└── README.md

---

How to Run the Script

Clone the repository:

git clone https://github.com/yourusername/linux-server-automation.git

Navigate into the project folder:

cd linux-server-automation

Make the script executable:

chmod +x setup_server.sh

Run the script:

sudo ./setup_server.sh

---

What the Script Does

1. Updates the system packages
2. Installs Docker, Git, Nginx, and monitoring tools
3. Configures the firewall
4. Creates a DevOps user
5. Deploys an Nginx container
6. Verifies container health
7. Displays system health information

---

Example Output

After successful execution, the script deploys a Docker container and verifies it by sending a request to the local web server.

You should see an HTTP response similar to:

HTTP/1.1 200 OK
Server: nginx

---

Learning Objectives

This project demonstrates:

- Linux server provisioning
- Bash automation scripting
- Docker container deployment
- Infrastructure verification
- Basic security hardening

---

Future Improvements

- Add Docker Compose support
- Add automated log rotation
- Add monitoring integration
- Add CI/CD pipeline automation

---

Author

Siphiwosenkhosi Dlamini
Bachelor of Computer Applications (BCA) Student
Aspiring DevOps / DevSecOps Engineer
