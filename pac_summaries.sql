DELETE FROM fec_bulk_pac_summaries;

CREATE TABLE IF NOT EXISTS fec_bulk_pac_summaries (
    cmte_id text,
    cmte_nm text,
    cmte_tp text,
    cmte_dsgn text,
    cmte_filing_freq text,
    ttl_receipts decimal(14,2),
    trans_from_aff decimal(14,2),
    indv_contrib decimal(14,2),
    other_pol_cmte_contrib decimal(14,2),
    cand_contrib decimal(14,2),
    cand_loans decimal(14,2),
    ttl_loans_received decimal(14,2),
    ttl_disb decimal(14,2),
    tranf_to_aff decimal(14,2),
    indv_refunds decimal(14,2),
    other_pol_cmte_refunds decimal(14,2),
    cand_loan_repay decimal(14,2),
    loan_repay decimal(14,2),
    coh_bop decimal(14,2),
    coh_cop decimal(14,2),
    debts_owed_by decimal(14,2),
    nonfed_trans_received decimal(14,2),
    contrib_to_other_cmte decimal(14,2),
    ind_exp decimal(14,2),
    pty_coord_exp decimal(14,2),
    nonfed_share_exp decimal(14,2),
    cvg_end_dt date
);

GRANT ALL ON TABLE fec_bulk_pac_summaries TO redash_default;
GRANT ALL ON TABLE fec_bulk_pac_summaries TO politics;
