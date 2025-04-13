-- Baseline 
CREATE INDEX company_name_name_pcode_nf ON company_name(name_pcode_nf);
CREATE INDEX company_name_name_pcode_sf ON company_name(name_pcode_sf);
SELECT * FROM company_name 
WHERE COALESCE(name_pcode_nf, name_pcode_sf) = 'A253';

-- Solution
SELECT * FROM company_name 
WHERE (name_pcode_nf = 'A253') 
OR (
name_pcode_nf IS NULL
AND name_pcode_sf = 'A253'
);