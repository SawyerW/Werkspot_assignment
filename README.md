# Werkspot_assignment
Only need to download the shell script and run it in container.

step 1: run docker commands to download portgres container:

docker run -it -d --name postgres_assignment -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=Strong123! postgres

step 2: copy assignment.sh to / in postgres container:

docker cp /path/assignment.sh  (postgres container_id):/

step 3: enter container, run chmod 555 assignment.sh

step 4: run ./assignment.sh

To check table, you can run commands like

psql -U postgres -d postgres -c 'SELECT * FROM dbt_yue.availability_snapshot'

