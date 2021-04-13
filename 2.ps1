docker build -t ap:1 .
start-process -FilePath "C:\Program Files\Docker\Docker\resources\bin\docker.exe" "run -p 127.0.0.1:80:5000/tcp ap:1" -NoNewWindow
$statuscode = 0
write-output "!!!!!!  Wait"
start-sleep -s 3
$statuscode = wget http://127.0.0.1:80 | % {$_.statuscode}
 

if ( $statuscode -eq 200 ) {
  write-output "!!!!!!----------Check Site = OK------------------!!!!!" }
else {
  write-output "!!!!!-----------Fail. Site not working-----------!!!!!" }
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)