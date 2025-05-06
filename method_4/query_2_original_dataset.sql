SELECT type , COUNT (*)
FROM titles
GROUP BY( type )
ORDER BY ( type ) ASC ; -- 0.31s


SELECT type , COUNT ( title_id )
FROM titles
GROUP BY( type )
ORDER BY ( type ) ASC ; -- 0.28s