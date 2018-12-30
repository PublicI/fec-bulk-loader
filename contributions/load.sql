DELETE FROM fec_bulk_contributions;

CREATE TABLE IF NOT EXISTS fec_bulk_contributions (
    cmte_id text,
    amndt_ind text,
    rpt_tp text,
    transaction_pgi text,
    image_num text,
    transaction_tp text,
    entity_tp text,
    name text,
    city text,
    state text,
    zip_code text,
    employer text,
    occupation text,
    transaction_dt date,
    transaction_amt decimal(12,2),
    other_id text,
    tran_id text,
    file_num text,
    memo_cd text,
    memo_text text,
    sub_id text
);

GRANT ALL ON TABLE fec_bulk_contributions TO redash_default;
GRANT ALL ON TABLE fec_bulk_contributions TO politics;
