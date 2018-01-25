#!/bin/bash

psql -U politics -h db.fivetwentyseven.com -c "TRUNCATE fec_committees;"
for cycle in 18 16 14; do
    wget -N "https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads/20"$cycle"/cm"$cycle".zip"
    unzip "cm"$cycle".zip"
    psql -U politics -h db.fivetwentyseven.com -c "COPY fec_committees FROM STDIN WITH CSV DELIMITER '|' QUOTE E'\b'" < cm.txt politics
    rm cm.txt
done
