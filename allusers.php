
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Selected User</title>
</head>
<body>
<?php
#include("/var/www/html/base.php");
$dsn = 'mysql:host=172.31.100.87;port=3306;dbname=brvv';
$db_name = 'brvv';
$db_username =  'root';
$db_pass =      'Smart!172';
$dbh = new PDO($dsn, $db_username, $db_pass);


$sql_select = "SELECT * FROM users";
$result = $dbh->query($sql_select);
$row = $result->fetch();
do
{
        printf("<p>User: " .$row['fst_name'] . " " .$row['lst_name'] ."</p>
        <p><i>Contacts</i></p><p>phone: " .$row['phone'] . "</p>---------<br/>"
        );
}
while($row = $result->fetch());
         ?>

</body>
</html>
