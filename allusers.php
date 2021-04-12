
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<link rel="stylesheet" type="text/css" href="style.css">
<title>App2 - Show all users</title>
</head>
<body>
<h1>PHP Application</h1>
<h1>view all user from DB</h1>
<?php

$dsn = 'mysql:host=172.31.100.87;port=3306;dbname=brvv';
$db_name = 'brvv';
$db_username =  'root';
$db_pass =      'Smart!172';
$dbh = new PDO($dsn, $db_username, $db_pass);


$sql_select = "SELECT * FROM users";
$result = $dbh->query($sql_select);
$row = $result->fetch();
printf("");
do
{
        printf("__________________________________________________________");
        printf("<p>User: " .$row['fst_name'] . " " .$row['lst_name'] ."</p>
        <p><i>Contacts</i></p><p>phone: " .$row['phone'] . "</p>"
        );
        printf("__________________________________________________________");
}
while($row = $result->fetch());
         ?>

</body>
</html>
