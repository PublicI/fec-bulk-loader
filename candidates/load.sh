#!/bin/bash

set -euo pipefail

psql -U politics -h db.fivetwentyseven.com politics -c "delete from fec_candidates;"
for cycle in 18 16 14 12 10 08 06 04 02 00; do #  98 96 94 92 90
    wget -N "https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads/20"$cycle"/cn"$cycle".zip"
    unzip "cn"$cycle".zip"
    psql -U politics -h db.fivetwentyseven.com politics -f candidates.sql
    rm cn.txt
done
