# Wordpress-Creation-Script-with-Docker
The script is designed to create a WordPress site using Docker. It does this by using the LEMP stack (Linux, Nginx, MySQL, PHP) and creating all the necessary containers using Docker Compose.

## Prerequisites

**Docker:** You need to have Docker installed on your system. If you don't have it installed, the script will install it for you.
**Docker Compose:** You also need to have Docker Compose installed on your system. If you don't have it installed, the script will install it for you.

## Installation

To install the script, follow these steps:

1. Download the script
```
git clone https://github.com/AnanthuAnil13/Wordpress-Creation-Script-with-Docker.git
```

2. Navigate into the downloaded folder
```
cd Wordpress-Creation-Script-with-Docker
```

3. Make the script executable
```
chmod +x docword-sct.sh
```

## Usage

1. ### Create New Wordpress Site
To create a new WordPress site, run the script with the site name as the first argument:
```
sudo bash docword-sct.sh example.com
```
This will create a new WordPress site with the name example.com. The script will also create an entry in the /etc/hosts file pointing to localhost so that you can access the site using the domain name example.com.
After the site is created, the script will prompt you to open it in a browser.

2. ### Enable/Disable Site
To enable or disable the site, use the enable or disable subcommand:
```
sudo bash docword-sct.sh example.com enable
```
```
sudo bash docword-sct.sh example.com disable
```

3. ### Delete Site
To delete the site, use the delete subcommand:
```
sudo bash docword-sct.sh example.com delete
```

4. ### Troubleshooting
If you encounter any issues while using the script, check the logs for the containers using the following command:
```
docker-compose logs
```
This will show you the logs for all the containers. You can also specify the name of a specific container to view its logs, e.g. docker-compose logs db to view the logs for the MySQL container.

## Notes

* This script was tested on a Debian-based distro. You may need to adjust the commands and paths accordingly depending on your system.
* The script installs Docker and Docker Compose if they are not already installed on your system.
* The script waits for 20 seconds for the site to be up and healthy before checking the status. You may need to adjust this value depending on your system and network conditions.

## License
This script is released under the [MIT License](https://github.com/AnanthuAnil13/Wordpress-Creation-Script-with-Docker/blob/main/LICENSE).
