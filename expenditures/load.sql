DROP TABLE fec_bulk_expenditures;

CREATE TABLE IF NOT EXISTS fec_bulk_expenditures (
    cmte_id text,
    amndt_ind text,
    rpt_yr text,
    rpt_tp text,
    image_num text,
    line_num text,
    form_tp_cd text,
    sched_tp_cd text,
    name text,
    city text,
    state text,
    zip_code text,
    transaction_dt text,
    transaction_amt decimal(12,2),
    transaction_pgi text,
    purpose text,
    category text,
    category_desc text,
    memo_cd text,
    memo_text text,
    entity_tp text,
    sub_id text,
    file_num text,
    tran_id text,
    back_ref_tran_id text
);
