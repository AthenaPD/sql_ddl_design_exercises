-- Query to find the team's ranking
-- Ranking rules: Win -> 2pts, draw -> 1pt, Lose -> 0pt

WITH score_tab AS (
    SELECT matches.id AS mid, team1, 
    CASE WHEN players.team_id = team1 THEN 1 ELSE 0 END score1,
    team2, 
    CASE WHEN players.team_id = team2 THEN 1 ELSE 0 END score2
    FROM matches 
    JOIN goals ON matches.id = goals.match_id
    JOIN players ON goals.player_id = players.id
),

mscores AS (
    SELECT mid, SUM(score1) AS score1, SUM(score2) AS score2
    FROM score_tab
    GROUP BY mid
    ORDER BY mid
),

team_score AS (
    SELECT mid, team1, score1, team2, score2 FROM mscores
    JOIN matches ON mscores.mid = matches.id
),

points_tab AS (
    SELECT team1, 
    CASE 
        WHEN score1 > score2 THEN 2
        WHEN score1 = score2 THEN 1
        ELSE 0
        END point1,
    team2,
    CASE
        WHEN score1 < score2 THEN 2
        WHEN score1 = score2 THEN 1
        ELSE 0
        END point2
    FROM team_score
),

first_half AS (
    SELECT team1 AS teamid, SUM(point1) AS points FROM points_tab GROUP BY team1
),

second_half AS (
    SELECT team2 AS teamid, SUM(point2) AS points FROM points_tab GROUP BY team2
),

combined_tab AS (
    SELECT teamid, points FROM first_half
    UNION
    SELECT teamid, points FROM second_half
),

tot_points AS (
    SELECT teamid, SUM(points) AS total_points FROM combined_tab 
    GROUP BY teamid
)

SELECT teams.id, teams.team_name, total_points FROM teams
JOIN tot_points ON teamid = teams.id
ORDER BY total_points DESC;
