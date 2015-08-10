##Create Droplet

Ubuntu 14.04

Enable Backups

##Reset Root Pass

ssh root@111.111.111.111

##Install Web Server

https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-14-04

```
sudo apt-get update
sudo apt-get install nginx
```

(ip should now resolve)

```
sudo apt-get install mysql-server
sudo mysql_install_db
sudo mysql_secure_installation
```

```
sudo apt-get install php5-fpm php5-mysql
sudo vim /etc/php5/fpm/php.ini
```

(type "/" and search for "cgi.fix_pathinfo")

(type INSERT to edit, uncomment, and set to "0")

(type ESC then :wq ENTER to save)

(optionally update upload_max_filesize and post_max_size)

```
sudo service php5-fpm restart
```

Edit file /etc/nginx/sites-available/default with NginX - Default value

```
sudo service nginx restart
```

##Install PHPMyAdmin

https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-with-nginx-on-an-ubuntu-14-04-server 

```
sudo apt-get update
sudo apt-get install phpmyadmin
```

(tab to skip prompt asking apache)

```
sudo ln -s /usr/share/phpmyadmin /usr/share/nginx/html
```

```
sudo php5enmod mcrypt
sudo service php5-fpm restart
```

(http://server_domain_or_IP/phpmyadmin)

##Change PHPMyAdmin url

```
cd /usr/share/nginx/html
sudo mv phpmyadmin moresecurephpmyadmin
```

## Virtual Hosts

```
sudo mkdir -p /var/www/website.com/public_html
sudo chown -R www-data:www-data /var/www/example.com/public_html
sudo chmod 755 /var/www
```

Add virtual host file to:

/etc/nginx/sites-available/website.com.conf

```
sudo ln -s /etc/nginx/sites-available/website.com.conf /etc/nginx/sites-enabled/website.com.conf
sudo service nginx restart
```

(optional - hosts file should display website now)

## MySQL Backup

```
sudo apt-get install automysqlbackup
```
(Postfix -> none)

## Fail2Ban

```
sudo apt-get install fail2ban
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```

## Install Git
sudo apt-get -y install git
git config --global user.name "Your Name"
git config --global user.email "youremail@domain.com"

## SSH
```
ssh-keygen 
```
<enter> <enter> <enter>
(copy pub key to bitbucket)

git clone [path]

## Deploy
git remote add production ssh://root@111.111.111.111/var/www/website.com/public_html
git push production
