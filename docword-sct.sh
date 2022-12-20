#!/usr/bin/env/bash

# Use set commands -e flag to exit the script as soon as no error is produced
set -e

# Check if site name was provided as a cli argument
if [ -z "$1" ]; then
  echo "ERROR 001: Site Name Missing!"
  echo "Please provide the site name as a command-line argument."
  exit 1
fi

site_name=$1
db_name="${site_name}_db"

# Check if curl is installed
if ! command -v curl > /dev/null; then
echo "Curl is not installed. Installing Curl..."
# Update the package list
sudo apt update
# Commands to install curl
sudo apt install -y curl
fi

# Check if Docker is installed
if ! command -v docker > /dev/null; then
	echo "Docker is not installed. Installing Docker..."
	# Update the package list
	sudo apt update
	# Commands to install docker
	sudo apt install -y docker.io
else
	echo "Docker is installed and up to date."
fi

# Check if Docker Compose is installed
if ! command -v docker-compose > /dev/null; then
	echo "Docker Compose is not installed. Installing Docker Compose..."
	# Update the package list
	sudo apt update
	# Commands to install docker
	latest_version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
	sudo curl -L "https://github.com/docker/compose/releases/download/$latest_version/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
else
	echo "Docker Compose is installed and up to date."
fi

# Create a /etc/hosts entry for the site
echo "127.0.0.1 $site_name" | sudo tee -a /etc/hosts

# Create a directory for the site
mkdir -p $site_name
cd $site_name

# Create a docker-compose.yml file
cat > docker-compose.yml <<EOF
version: '3.3'

services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: $db_name
      MYSQL_USER: admin
      MYSQL_PASSWORD: password
  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    ports:
      - "8080:8080"
    volumes:
      - ./:/var/www/html
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: admin
      WORDPRESS_DB_PASSWORD: password
      WORDPRESS_DB_NAME: $db_name

volumes:
  db_data:
EOF

if [ -z "$2" ]; then
	# Start the LEMP stack using docker-compose
	docker-compose up -d

	# Wait for the WordPress site to be up and healthy
	while ! curl -sL http://$site_name > /dev/null; do
		echo "Configuring Wordpress Site..."
		sleep 3
		echo "Configuring Site Details..."
		sleep 3
		echo "Finding the domain..."
		sleep 3
		echo "Going to get coffe before finishing up..."
		sleep 3
		echo "Just a bit more..."
		sleep 3
	done

	echo "Site Crafting Completed!"
	echo "The WordPress site is up and running!"

	# Open the url in the deault browser
	read -p "Do you want to open $site_name in your browser? (y/n)" input
	if [ "$input" = "y" ] || [ "$input" = "Y" ]; then
		echo "Proceeding..."
		url="http://${site_name}"
		echo $url
		# Opening firefox with the site
		sudo xhost +
		sudo firefox $url
	else
		echo "Thank You for using docword-sct!"
	fi
# Check if user wants to enable/disable/delete the site
elif [ "$2" = "enable" ]; then
  docker-compose start
  echo "The site has been enabled."
elif [ "$2" = "disable" ]; then
  docker-compose stop
  echo "The site has been disabled."
elif [ "$2" = "delete" ]; then
  # Stop and remove the containers and the local files
  docker-compose down -v
  # Remove the /etc/hosts entry for the site
  sed -i "/${site_name}/d" /etc/hosts
  echo "The site has been deleted."
fi

# Check if the site is up and healthy
response_code=$(curl -s -o /dev/null -w "%{http_code}" http://${site_name}:8080)
if [ "$response_code" -ne 200 ]; then
  echo "Error 002: The site is not up."
  exit 1
fi