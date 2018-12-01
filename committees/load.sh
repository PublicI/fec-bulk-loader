#!/bin/bash

set -euo pipefail

CYCLES="${CYCLES:-18 16 14 12 10 08 06 04 02 00}" #  98 96 94 92 90

psql -c "delete from fec_committees;"
for cycle in $CYCLES; do
    wget -N "https://www.fec.gov/files/bulk-downloads/20"$cycle"/cm"$cycle".zip"
    unzip "cm"$cycle".zip"
    psql -f load.sql
    rm cm.txt
done
