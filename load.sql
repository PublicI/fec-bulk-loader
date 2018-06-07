create temporary table fec_committees_temp (id text, name text, treasurer text, street_1 text, street_2 text, city text, state text, zip text, designation text, type text, party text, frequency text, org_type text, connected_org_name text, candidate_id text);

create table if not exists fec_committees (id text, name text, treasurer text, street_1 text, street_2 text, city text, state text, zip text, designation text, type text, party text, frequency text, org_type text, connected_org_name text, candidate_id text);

\copy fec_committees_temp from 'cm.txt' with CSV DELIMITER '|' QUOTE E'\b';

delete from fec_committees using fec_committees_temp where fec_committees.id = fec_committees_temp.id;

insert into fec_committees (id, name, treasurer, street_1, street_2, city, state, zip, designation, type, party, frequency, org_type, connected_org_name, candidate_id) select id, name, treasurer, street_1, street_2, city, state, zip, designation, type, party, frequency, org_type, connected_org_name, candidate_id from fec_committees_temp;

drop table fec_committees_temp;

create table if not exists fec_candidates (cand_id text, cand_name text, cand_pty_affiliation text, cand_election_yr text, cand_office_st text, cand_office text, cand_office_district text, cand_ici text, cand_status text, cand_pcc text, cand_st1 text, cand_st2 text, cand_city text, cand_st text, cand_zip text);

\copy fec_candidates from 'cn.txt' with CSV DELIMITER '|' QUOTE E'\b';
