-- Baseline
CREATE OR REPLACE FUNCTION num_people_by_job(p_title_id varchar, p_job varchar) RETURNS integer 
AS
$$BEGIN
RETURN (
SELECT COUNT(DISTINCT p.person_id)
FROM public.crew c
JOIN public.people p ON c.person_id = p.person_id
WHERE c.title_id = p_title_id
AND c.job = p_job;
);
END;
$$ LANGUAGE plpgsql;
SELECT 
t.title_id,
t.primary_title,
num_people_by_job(t.title_id, 'actor') AS num_actors
FROM public.titles t
WHERE type = 'tvSpecial'
GROUP BY t.title_id
ORDER BY num_actors DESC;

-- Solution
SELECT 
t.title_id,
t.primary_title,
COUNT(DISTINCT p.person_id) AS num_people
FROM public.titles t
JOIN public.crew c ON t.title_id = c.title_id
JOIN public.people p ON c.person_id = p.person_id
WHERE t.type = 'tvSpecial'
AND c.category = 'actor'
GROUP BY t.title_id
ORDER BY num_actors DESC;
