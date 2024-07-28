# Write your MySQL query statement below

#count event_date = lag_day group by play_id / count distinct

WITH FirstLogins AS (
    SELECT player_id, min(event_date) as first_login
    FROM Activity
    GROUP BY player_id
),
ConsecutiveLogins AS (
    SELECT a.player_id, a.event_date, f.first_login
    FROM Activity a
    JOIN FirstLogins f ON a.player_id = f.player_id
    WHERE a.event_date = date_add(f.first_login, interval 1 day)
)
SELECT round(count(distinct c.player_id) / count(distinct f.player_id),2) as fraction
FROM FirstLogins f
LEFT JOIN ConsecutiveLogins c ON f.player_id = c.player_id;