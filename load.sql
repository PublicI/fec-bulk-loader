CREATE TEMPORARY TABLE fec_committees_temp (
    id text,
    name text,
    treasurer text,
    street_1 text,
    street_2 text,
    city text,
    state text,
    zip text,
    designation text,
    TYPE text,
    party text,
    frequency text,
    org_type text,
    connected_org_name text,
    candidate_id text
);


CREATE TABLE IF NOT EXISTS fec_committees (
   id text,
   name text,
   treasurer text,
   street_1 text,
   street_2 text,
   city text,
   state text,
   zip text,
   designation text,
   TYPE text,
   party text,
   frequency text,
   org_type text,
   connected_org_name text,
   candidate_id text
);

GRANT ALL ON TABLE fec_committees TO redash_default;
GRANT ALL ON TABLE fec_committees TO politics;

\COPY fec_committees_temp FROM 'cm.txt' WITH CSV DELIMITER '|' QUOTE E'\b';


DELETE
FROM fec_committees USING fec_committees_temp
WHERE fec_committees.id = fec_committees_temp.id;


INSERT INTO fec_committees (
    id,
    name,
    treasurer,
    street_1,
    street_2,
    city,
    state,
    zip,
    designation,
    TYPE,
    party,
    frequency,
    org_type,
    connected_org_name,
    candidate_id
)
SELECT id,
       name,
       treasurer,
       street_1,
       street_2,
       city,
       state,
       zip,
       designation,
       TYPE,
       party,
       frequency,
       org_type,
       connected_org_name,
       candidate_id
FROM fec_committees_temp;


DROP TABLE fec_committees_temp;

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

