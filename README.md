**Andersen DevOps course Exam**
_____________________________________________________

## **Objective:**

* Objectives for the Exam are placed in the file: *DevOpsExamObjective.pdf*

## Solution:

The infrastructure diagram and the deployment process are reflected in the files in the folder _**Schemes**_

**Technology stack:**
1. GitHub - for code versions control
2. AWS Elastic Beanstalk - for deploy code to Infrastructure (Docker containers)
3. AWS CodePipeline - for implementation CI/CD process.

**CI/CD process in my project implemented as follows:**
1. Developer change the code.
2. Run PowerShell script for first test the code in the container same as in infrastructure. Script check the Web-page accessibility (by code 200) and send message "OK" or "FAIL". After that script stops the containers and remove all containers.
3. If the test was OK. Developer commit the changes and push they to GitHub.
4. On the **PUSH IN THE BRANCH** of the application launches a trigger to deploy in AWS CodePipeline for this Application.
5. The code is delivered to the working environment and run in it.


### Application 1:
* Programming Language: Python (Flask)
* Docker Image: python:3.6-alpine 


* The application shows three pages:
1. */*
2. */an*
3. */user/some_text* 
* Application open first page - "Hello World 1" with link to second page.
* Second page have a Picture. Also this page open as *host/an*
* Third page *host/user/XXXX* open page for XXXX and shows on the page text like a **"User page for User: XXXX"**


### Application 2:
* Programming Language: PHP
* Docker Image:         php:8.0-apache 

Application open first page with text "Hello World 2" and the Button. If you click on the button, a second page opens and it displays data about users from the test DB.
The base (MySQL) locate on a separate EC2 and Subnet but in the same VPC.

### DataBase:
On the EC2 instance. It is MySQL DB, Manual deployed.
Process:
1. Create EC2 instance into original VPC.
2. For configuration connected Elastic IPv4 address (later can be deleted) 
2. SG allow port 22 to admin host in Internet for configuration. Port 3306 open for local VPC.
3. Install MySQL DB Server
4. Configure access to DB
5. Create simple DB


**Instalation MySQL**
```bash
sudo wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum localinstall mysql57-community-release-el7-11.noarch.rpm
sudo yum install mysql-community-server
sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service
#Get temporary password
sudo grep 'temporary password' /var/log/mysqld.log
#Change password
mysql_secure_installation
```
Open SQL console
```bash
mysql -u root -p
For connection other EC2 instances to DB need add IP-addresses to DB security:
#Check from wich addresses allowed access:
SELECT host FROM mysql.user WHERE User = 'root';
#Add from wich address will allow access
CREATE USER 'root'@'ip_address' IDENTIFIED BY 'some_pass';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'ip_address';
#OR from anywhere:
CREATE USER 'root'@'%' IDENTIFIED BY 'some_pass';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
#Reload permissions
FLUSH PRIVILEGES;

#Create simple DB
create database brvv;
use brvv;
create table users (id int PRIMARY KEY AUTO_INCREMENT, fst_name varchar(255), lst_name varchar(255),phone varchar(20));
INSERT users(fst_name, lst_name, phone) VALUES ('Petr', 'Ivanov', '+79001112233'), ('second', 'Pepe', '+79002223344'), ('Sy', 'Sys', '+79003334455');
```


## Results:
1. CI/CD process developed based on AWS Services and GitHub
2. Developed two Application by Python and PHP languages.
3. Two diagrams are drawn: 1. Project Infrastucure, 2. CI/CD wanted and real.
4. Initial testing by the PowerShell script runs Docker Container locally
5. Auto launch deploy process by the Push the code to GitHub.
6. Implemented LifeCycle Policy for Configurations Store in AWS Elastic Beanstalk
7. It is possible to view the log and monitor through AWS Cloud Watch and special views in Elastic Beanstalk
8. Implemented Notifications about Code PipeLine process by AWS SNS to external e-Mail.
