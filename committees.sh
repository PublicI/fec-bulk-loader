#!/bin/bash

psql -c "delete from fec_committees;"
for cycle in 18 16 14 12 10 08 06 04 02 00; do #  98 96 94 92 90
    wget -N "https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads/20"$cycle"/cm"$cycle".zip"
    unzip "cm"$cycle".zip"
    psql -f committees.sql
    rm cm.txt
done
