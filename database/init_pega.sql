-- 
CREATE SCHEMA rules
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA rules TO postgres;

-- 
CREATE SCHEMA data
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA data TO postgres;

--
ALTER ROLE postgres IN DATABASE postgres
    SET search_path TO 'rules,data';
