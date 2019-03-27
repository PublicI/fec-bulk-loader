#!/bin/bash

set -euo pipefail

CYCLES="${CYCLES:-00 02 04 06 08 10 12 14 16 18 20}" #  98 96 94 92 90

psql -c "delete from fec_committees;"
for cycle in $CYCLES; do
    wget -N "https://www.fec.gov/files/bulk-downloads/20"$cycle"/cm"$cycle".zip"
    unzip "cm"$cycle".zip"
    psql -f load.sql
    rm cm.txt
done
