-- START SESSION
-- creating some tables and inserting data

CREATE TABLE players 
(
    player_num NUMBER(3) NOT NULL,
    full_name VARCHAR2(50) NOT NULL UNIQUE,
    position_id NUMBER(2) NOT NULL,
    team_id NUMBER(2) NOT NULL,
    fav_food VARCHAR(50) NOT NULL,
    dob DATE NOT NULL
);

CREATE TABLE positions 
(
    position_id NUMBER(2) NOT NULL UNIQUE,
    position_name VARCHAR2(50) NOT NULL UNIQUE
);

INSERT INTO positions
    (position_id, position_name)
        VALUES(1, 'Heavy Forward');        
INSERT INTO positions
    (position_id, position_name)
        VALUES(2, 'Playing Guard');
INSERT INTO positions
    (position_id, position_name)
        VALUES(3, 'Center');

CREATE TABLE teams 
(
    team_id NUMBER(2) NOT NULL UNIQUE,
    team_name VARCHAR2(50) NOT NULL UNIQUE
);

INSERT INTO teams
    (team_id, team_name)
        VALUES(1, 'Los Angeles Lakers');
INSERT INTO teams
    (team_id, team_name)
        VALUES(2, 'Golden State Warriors');
INSERT INTO teams
    (team_id, team_name)
        VALUES(3, 'San Antonio Spurs');
        
INSERT INTO players 
    (player_num, full_name, position_id, team_id, fav_food, dob)
        VALUES(23, 'Lebron James', 1, 1, 'Taco', '30/12/1984');       
INSERT INTO players 
    (player_num, full_name, position_id, team_id, fav_food, dob)
        VALUES(30, 'Steph Curry', 2, 2, 'Pizza', '14/03/1988');
INSERT INTO players 
    (player_num, full_name, position_id, team_id, fav_food, dob)
        VALUES(1, 'Victor Wembanyama', 3, 3, 'Sushi Rolls', '04/01/2004');
   
SELECT 
p.player_num,
p.full_name,
p.position_id,
s.position_name,
p.team_id,
t.team_name,
p.fav_food,
p.dob
FROM players p INNER JOIN positions s
ON p.position_id = s.position_id
JOIN teams t
ON p.team_id = t.team_id;

commit;

CREATE OR REPLACE VIEW all_players_info AS
SELECT
p.player_num,
p.full_name,
p.position_id,
s.position_name,
p.team_id,
t.team_name,
p.fav_food,
p.dob
FROM players p INNER JOIN positions s
ON p.position_id = s.position_id
JOIN teams t
ON p.team_id = t.team_id;

SELECT * FROM all_players_info;

-- NEXT SESSION        
-- Adding some more Constraints
-- Using select statement and single row function
ALTER TABLE positions
ADD playstyle VARCHAR2(50);

UPDATE positions 
SET playstyle = 'More points';

rollback;

SELECT * FROM positions;

commit;

SELECT * FROM players;

SELECT 
player_num num, full_name ||' #'|| player_num jersey, fav_food
FROM players;

SELECT 
player_num + 10 new_num, full_name, null ||'I Love eat '|| fav_food lovers_food
FROM players;

SELECT 
COUNT(fav_food) counter_food FROM players;

SELECT * FROM players WHERE team_id = 1;

SELECT * FROM players ORDER BY full_name DESC;

SELECT player_num, full_name, TO_CHAR(dob, 'yyyy') dob_year FROM players;

SELECT player_num, full_name, TO_NUMBER(TO_CHAR(dob, 'yyyy')) + 20 dob_year FROM players;

SELECT player_num, full_name, TO_CHAR(dob, 'Mon') dob_mon FROM players;
