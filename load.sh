#!/bin/bash

psql -U politics -h db.fivetwentyseven.com politics -c "delete from fec_committees;"
psql -U politics -h db.fivetwentyseven.com politics -c "delete from fec_candidates;"
for cycle in 02 04 06 08 10 12 14 16 18; do
    wget -N "https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads/20"$cycle"/cm"$cycle".zip"
    unzip "cm"$cycle".zip"
    wget -N "https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads/20"$cycle"/cn"$cycle".zip"
    unzip "cn"$cycle".zip"
    psql -U politics -h db.fivetwentyseven.com politics -f load.sql
    rm cm.txt
    rm cn.txt
done
