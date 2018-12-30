#!/bin/bash

set -euo pipefail

CYCLES="${CYCLES:-18 16 14 12 10 08 06 04 02 00}" #  98 96 94 92 90

psql -f load.sql
for cycle in $CYCLES; do
    wget -N "https://www.fec.gov/files/bulk-downloads/20"$cycle"/webk"$cycle".zip"
    unzip "webk"$cycle".zip"
    psql -c "\COPY fec_bulk_pac_summaries FROM 'webk"$cycle".txt' WITH CSV DELIMITER '|' QUOTE E'\b';"
    rm "webk"$cycle".txt"
done
