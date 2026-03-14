System Architecture

This project automates the provisioning of a Linux server and deploys a Docker container running an Nginx web server.

Architecture Overview

                +----------------------+
                |      Internet        |
                +----------+-----------+
                           |
                           |
                    +------v------+
                    |   Firewall  |
                    |   (UFW)     |
                    +------+------+
                           |
                           |
                +----------v-----------+
                |     Ubuntu Server    |
                |                      |
                |  +----------------+  |
                |  |  Docker Engine |  |
                |  +--------+-------+  |
                |           |          |
                |    +------v------+   |
                |    | Nginx        |  |
                |    | Container    |  |
                |    | (Port 8080)  |  |
                |    +-------------+   |
                |                      |
                |  Security Services   |
                |  - Fail2Ban          |
                |  - UFW Firewall      |
                |                      |
                +----------------------+


Components

Ubuntu Server

The base operating system where the automation script runs.

Docker Engine

Used to deploy and manage containerized applications.

Nginx Container

A lightweight web server running inside a Docker container, exposed on port 8080.

UFW Firewall

Controls incoming and outgoing network traffic.

Fail2Ban

Protects the server from brute-force attacks by monitoring logs and banning suspicious IP addresses.

Deployment Flow

1. The automation script updates the server.
2. DevOps tools are installed.
3. Security services are configured.
4. Docker is installed and started.
5. An Nginx container is deployed.
6. The container is verified using HTTP requests.
7. System health information is displayed.
