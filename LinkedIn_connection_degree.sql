WITH RECURSIVE connection_path AS (
    -- Anchor Member: شروع با کاربر 256
    SELECT user_1, user_2, 1 AS degree
    FROM connections
    WHERE user_1 = 256

    UNION ALL

    -- Recursive Member: پیدا کردن مسیرهای بعدی
    SELECT c.user_1, c.user_2, cp.degree + 1
    FROM connections c
    INNER JOIN connection_path cp ON c.user_1 = cp.user_2
    WHERE c.user_2 <= 512
)
SELECT
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM connections
            WHERE (user_1 = 256 AND user_2 = 512)
        ) THEN 1
        ELSE MIN(degree)
    END AS degree
FROM connection_path
WHERE user_2 = 512
HAVING degree IS NOT NULL
UNION
SELECT NULL AS degree
WHERE NOT EXISTS (
    SELECT 1
    FROM connection_path
    WHERE user_2 = 512
) AND NOT EXISTS (
    SELECT 1
    FROM connections
    WHERE (user_1 = 256 AND user_2 = 512)
);