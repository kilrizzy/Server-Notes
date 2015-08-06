#Create Droplet

droplet-hostname
$5/mo
Ubuntu 14.04
Enable Backups

#Reset Root Pass

ssh root@111.111.111.111

#Install Web Server

https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-14-04

sudo apt-get update
sudo apt-get install nginx

(ip should now resolve)

sudo apt-get install mysql-server
sudo mysql_install_db
sudo mysql_secure_installation

sudo apt-get install php5-fpm php5-mysql
sudo vim /etc/php5/fpm/php.ini
(type "/" and search for "cgi.fix_pathinfo")
(type INSERT to edit, uncomment, and set to "0")
(type ESC then :wq ENTER to save)
sudo service php5-fpm restart

Edit file /etc/nginx/sites-available/default with NginX - Default value

sudo service nginx restart

#Install PHPMyAdmin

https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-with-nginx-on-an-ubuntu-14-04-server 

sudo apt-get update
sudo apt-get install phpmyadmin
(tab to skip prompt asking apache)

sudo ln -s /usr/share/phpmyadmin /usr/share/nginx/html

sudo php5enmod mcrypt
sudo service php5-fpm restart

(http://server_domain_or_IP/phpmyadmin)

#Change PHPMyAdmin url

cd /usr/share/nginx/html
sudo mv phpmyadmin moresecurephpmyadmin

# Virtual Hosts

asd



