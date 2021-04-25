
## isntallation
apt-get update && apt-get install -y git
apt-get update && apt-get install -y python3
apt-get update && apt-get install -y python3-pip
pip3 install dbt
mkdir ~/.dbt/

## download the repository
mkdir git_assignment
cd git_assignment
git init
git clone https://github.com/SawyerW/Werkspot_assignment

## profiles of dbt
mv Werkspot_assignment/profiles.yml ~/.dbt/

## commands for task 1
cd Werkspot_assignment/werkspot/
dbt seed
dbt run --models event_copy
dbt run --models event_info
dbt run --models professional_events
dbt run --models proposed_events


## commands for task 2
dbt snapshot
