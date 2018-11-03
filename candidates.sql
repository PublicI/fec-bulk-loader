CREATE TABLE IF NOT EXISTS fec_candidates (
    cand_id text,
    cand_name text,
    cand_pty_affiliation text,
    cand_election_yr text,
    cand_office_st text,
    cand_office text,
    cand_office_district text,
    cand_ici text,
    cand_status text,
    cand_pcc text,
    cand_st1 text,
    cand_st2 text,
    cand_city text,
    cand_st text,
    cand_zip text
);

GRANT ALL ON TABLE fec_candidates TO redash_default;
GRANT ALL ON TABLE fec_candidates TO politics;

\COPY fec_candidates FROM 'cn.txt' WITH CSV DELIMITER '|' QUOTE E'\b';
