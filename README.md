# Werkspot_assignment
step 1: run docker commands to download portgres container: 
docker run -it -d --name postgres_assignment -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=Strong123! postgres

step 2: docker cp /path/assignment.sh  (postgres container_id):/

step 3: enter container, run chmod 555 assignment.sh 

step 4: run ./assignment.sh
