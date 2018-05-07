create temporary table fec_committees_temp (id text, name text, treasurer text, street_1 text, street_2 text, city text, state text, zip text, designation text, type text, party text, frequency text, org_type text, connected_org_name text, candidate_id text);

create table if not exists fec_committees (id text, name text, treasurer text, street_1 text, street_2 text, city text, state text, zip text, designation text, type text, party text, frequency text, org_type text, connected_org_name text, candidate_id text);

\copy fec_committees_temp from 'cm.txt' with CSV DELIMITER '|' QUOTE E'\b';

delete from fec_committees using fec_committees_temp where fec_committees.id = fec_committees_temp.id;

insert into fec_committees (id, name, treasurer, street_1, street_2, city, state, zip, designation, type, party, frequency, org_type, connected_org_name, candidate_id) select id, name, treasurer, street_1, street_2, city, state, zip, designation, type, party, frequency, org_type, connected_org_name, candidate_id from fec_committees_temp;

drop table fec_committees_temp;