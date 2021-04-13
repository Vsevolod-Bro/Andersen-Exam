docker build -t ap:1 .
Start-Process -FilePath "C:\Program Files\Docker\Docker\resources\bin\docker.exe" "run -p 127.0.0.1:80:80/tcp ap:1" -NoNewWindow
$statuscode = 0
$statuscode = wget http://127.0.0.1:80 | % {$_.statuscode}
if ( $statuscode -eq 200 ) {
  write-output "!!!!!!----------Check Site = OK------------------!!!!!" }
else {
  write-output "!!!!!-----------Fail. Site not working-----------!!!!!" }
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)