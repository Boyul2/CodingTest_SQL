WITH RECURSIVE colony AS(
    SELECT
        id,
        parent_id,
        1 AS gen
    FROM ecoli_data
    WHERE parent_id IS NULL
    
    UNION ALL
    
    SELECT
        e.id,
        e.parent_id,
        c.gen + 1 AS gen
    FROM ecoli_data e
    JOIN colony c
    ON e.parent_id = c.id
    WHERE c.gen < 3
)

SELECT id
FROM colony
WHERE gen = 3
ORDER BY id;