**Andersen DevOps course Exam**
_____________________________________________________

## **Objective:**

* Objectives for the Exam are placed in the file: *DevOpsExamObjective.pdf*

## Solution:

### Application 1:

### Application 2:

### DataBase:
On the EC2 instance. It is MySQL DB, Manual deployed.
Process:
1. Create EC2 instance into original VPC.
2. For configuration connected Elastic IPv4 address (later can be deleted) 
2. SG allow port 22 to admin host in Internet for configuration. Port 3306 open for local VPC.
3. 

**Instalation MySQL**
sudo wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum localinstall mysql57-community-release-el7-11.noarch.rpm
sudo yum install mysql-community-server
sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service
# Get temporary password
sudo grep 'temporary password' /var/log/mysqld.log
# Change password
mysql_secure_installation
# Open SQL console
mysql -u root -p
For connection other EC2 instances to DB need add IP-addresses to DB security:
# Check from wich addresses allowed access:
SELECT host FROM mysql.user WHERE User = 'root';
# Add from wich address will allow access
CREATE USER 'root'@'ip_address' IDENTIFIED BY 'some_pass';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'ip_address';
# OR from anywhere:
CREATE USER 'root'@'%' IDENTIFIED BY 'some_pass';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
# Reload permissions
FLUSH PRIVILEGES;




2. IAM role allow access to EC2 instances for read???

I did the task in Two stages:
* In the **first** Stage, I created the main infrastructure. Then I configured EC2 to connect to the Internet through one NAT and install *nginx* from the Internet repository. Creation of *index.html* and installation of *nginx* I made in the script located in the **UserData**. This is implemented in __*aws-cf-01.yml*__
* In the **second** Stage, I create a S3 bucket. I created in there 3 objects (folders) and will placed in there *nginx* rpm-package, *index.html* for one EC2 instance and other *index.html* for second EC2 instance. Next I created S3 EndPoint connection, remove NAT-Gateway and change the UserData in that manner it's copy and install nginx via EndPoint from S3 bucket, and also copy index.html file from S3 to a required folder. In the second stage I add the **AutoRecovery** block. For the S3 Bucket access I created Role, and modify Security Group. This is implemented in __*aws-cf-02.yml*__

**Template work only for Oregon (us-west-2) because the ImageId is static**

**The template do:**
1.  Block the parameters that contains the object names, net CIDRs.
2.  Create a VPC
3.  Create a InternetGateway, IGW-VPC attachment and Route Table for VPC
4.  Create route for external nets via IGW
5.  Create Public subnets
6.  Create Private subnets
7.  Create RouteTables, Associations and Route for subnets
8.  Create EndPoint
9.  Create Security Group
10. Create Role and Policy for S3 access via EndPoint, Instance profile for this Role
11. Create EC2 with UserData
12. Create ALB, ALB Listener and ALB Target Group
13. Create AutoRecovery


## Results:
1. Created a template for the given diagram (The one with connect to Internet via NAT, the Second with connect to S3 via EndPoint without Internet connection)
2. Add AutoRecovery for EC2
3. Corrected the diagram (in the folder __*Schemes*__)
4. Azure          - not implemented
5. Script-wrapper - not implemented (could be pass the Image ID )
6. I want make the procedure that will get the Image ID by the Image name - not implemented
7. Create S3-Bucket with the Code - is it needed?
