#!/bin/bash

set -e
echo "===== Starting Linux Server Automation ====="

LOGFILE="/var/log/server_setup.log"
exec > >(tee -a $LOGFILE) 2>&1

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo."
  exit 1
fi

echo "Updating system packages..."
apt update -y
apt upgrade -y

echo "Installing essential packages..."
apt install -y git curl docker.io ufw htop net-tools fail2ban nginx

echo "Enabling and starting Docker..."
systemctl enable docker
systemctl start docker

echo "Creating DevOps user..."

USERNAME="devopsuser"

if id "$USERNAME" &>/dev/null; then
    echo "User $USERNAME already exists."
else
    useradd -m -s /bin/bash $USERNAME
    echo "Set password for $USERNAME:"
    passwd $USERNAME
fi

echo "Adding $USERNAME to Docker group..."
usermod -aG docker $USERNAME

echo "Configuring firewall..."

ufw allow OpenSSH
ufw allow 80
ufw allow 443
ufw --force enable

echo "Starting security service (fail2ban)..."

systemctl enable fail2ban
systemctl start fail2ban

echo "Deploying Docker container..."

CONTAINER_NAME="nginx-server"

docker rm -f $CONTAINER_NAME 2>/dev/null || true

docker run -d --name $CONTAINER_NAME -p 8080:80 nginx

echo "Waiting for container to start..."
sleep 5

echo "Checking container status..."

if docker ps | grep -q $CONTAINER_NAME
then
    echo "Container is running successfully"
else
    echo "Container failed to start"
    exit 1
fi

echo "Testing web server response..."

curl -I http://localhost:8080

echo "Creating test webpage..."

echo "<h1>DevOps Server Deployment Successful</h1>" > /var/www/html/index.html

echo "Checking installations..."

echo "Git version:"
git --version

echo "Docker version:"
docker --version

echo "Nginx version:"
nginx -v

echo "Firewall status:"
ufw status

echo "Docker containers running:"
docker ps

echo "System health report:"
echo "Uptime:"
uptime

echo "Disk usage:"
df -h

echo "Memory usage:"
free -m

echo "===== SERVER SETUP COMPLETE ====="
echo "Log file saved at: $LOGFILE"
