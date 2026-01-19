WITH fish_rn AS(
    SELECT 
        ROW_NUMBER() OVER(
            PARTITION BY fish_type
            ORDER BY length DESC
        ) AS rn,
        id,
        fish_name,
        length
    FROM FISH_INFO
    INNER JOIN FISH_NAME_INFO
    USING(FISH_TYPE)
)

SELECT id, fish_name, length
FROM fish_rn
WHERE rn = 1
ORDER BY id