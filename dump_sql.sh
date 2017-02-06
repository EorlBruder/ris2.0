mysqldump -u sopro -P 9023 -h eorlbruder.de -p sopro --routines > db/dumps/dump_$(date +"%Y_%m_%d").sql

mysqldump -u sopro -P 9023 -h eorlbruder.de -p sopro --routines --no-data > db/dumps/structure_dump_$(date +"%Y_%m_%d").sql

## TO Import you need to run something like "mysql <database> < (structure)_dump_date.sql"