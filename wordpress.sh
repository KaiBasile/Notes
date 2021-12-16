#!/bin/bash

#locate wordpress installations
find ./ -type f -name "wp-config.php"

#Read the wordpress config file into a variable
read -p "Which wordpress?" wp_config


#extract database from wp_config file
grep DB_ "$wp_config"

#read database credentials into variables
read -p "Name of mysql user" wp_user
read -p "Name of database" wp_database

#test login as mysql user, you will need to paste password from grep output
mysql -u $wp_user -p $wp_database

#generate a database backup, you will need to paste password from grep output
mysqldump -u $wp_user -p $wp_database > $wp_database.sql

