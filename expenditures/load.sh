#!/bin/bash

set -euo pipefail

CYCLES="${CYCLES:-18 16 14 12 10 08 06 04}" # 02 00 98 96 94 92 90

psql -f load.sql
for cycle in $CYCLES; do
    if [ "$cycle" -eq 02 ] || [ "$cycle" -eq 00 ]
    then
        continue
    fi

    wget -nv -N "https://www.fec.gov/files/bulk-downloads/20"$cycle"/oppexp"$cycle".zip"
    unzip "oppexp"$cycle".zip" "oppexp.txt"
    psql -c "\COPY fec_bulk_expenditures FROM 'oppexp.txt' WITH CSV DELIMITER '|' QUOTE E'\b' ENCODING 'LATIN1';"
    rm "oppexp.txt"
done
