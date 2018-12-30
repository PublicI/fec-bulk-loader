#!/bin/bash

set -euo pipefail

CYCLES="${CYCLES:-18 16 14 12 10 08 06 04 02 00}" #  98 96 94 92 90

psql -f load.sql
for cycle in $CYCLES; do
    wget -nv -N "https://www.fec.gov/files/bulk-downloads/20"$cycle"/indiv"$cycle".zip"
    unzip "itcont"$cycle".zip"
    psql -c "\COPY fec_bulk_contributions FROM 'itcont"$cycle".txt' WITH CSV DELIMITER '|' QUOTE E'\b';"
    rm "itcont"$cycle".txt"
done
