SELECT 
    writer_id AS user_id,
    nickname,
    CONCAT(city, ' ', street_address1, ' ',street_address2) AS '전체주소',
    CONCAT(SUBSTRING(tlno, 1, 3), '-', SUBSTRING(tlno, 4, 4), '-', SUBSTRING(tlno, 8, 4)) AS '전화번호'
FROM USED_GOODS_BOARD b
    INNER JOIN USED_GOODS_USER u
    ON b.writer_id = u.user_id
GROUP BY writer_id
HAVING COUNT(board_id) >= 3
ORDER BY writer_id DESC