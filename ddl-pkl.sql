-- PROGRESSION - 1


-- 1. **Create table city**
Create Table city
( 
id NUMBER(11),
name VARCHAR(50) NOT NULL,
Constraint pk_city PRIMARY KEY (id)
);
-- 2. **Create table referee**
Create Table referee
( 
id NUMBER(11),
name VARCHAR(50) NOT NULL,
Constraint pk_referee PRIMARY KEY (id)
);
-- 3. **Create table innings**
Create Table innings
( 
id NUMBER(11),
innings_number NUMBER(11) NOT NULL,
Constraint pk_innings PRIMARY KEY (id)
);
-- 4. **Create table extra_type**
Create Table extra_type
( 
id NUMBER(11),
name VARCHAR(50) NOT NULL,
Constraint pk_extra_type PRIMARY KEY (id)
);
-- 5. **Create table skill**
Create Table skill
( 
id NUMBER(11),
name VARCHAR(50) NOT NULL,
Constraint pk_skill PRIMARY KEY (id)
);
-- 6. **Create table team**
Create Table team
(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
coach VARCHAR(50) NOT NULL,
home_city NUMBER(11) NOT NULL,
captain NUMBER(11) NOT NULL,
Constraint pk_team PRIMARY KEY (id),
Constraint fk_team FOREIGN KEY(home_city)References city(id)
);
-- 7. **Create table player**
Create Table player
(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
skill_id NUMBER(11) NOT NULL,
team_id NUMBER(11) NOT NULL,
Constraint pk_player_id PRIMARY KEY (id),
Constraint fk_player_skill FOREIGN KEY (skill_id) REFERENCES skill(id),
Constraint fk_player_team FOREIGN KEY (team_id) REFERENCES team(id)
);
-- 8. **Create table venue**
Create Table venue
(
id NUMBER(11),
stadium_name VARCHAR(50) NOT NULL,
city_id NUMBER(11) NOT NULL,
CONSTRAINT pk_venue PRIMARY KEY(id),
CONSTRAINT fk_venue FOREIGN KEY(city_id) REFERENCES city(id)
);
-- 9. **Create table event**
Create Table event
(
id NUMBER(11),
innings_id NUMBER(11) NOT NULL,
event_no NUMBER(11) NOT NULL,
raider_id NUMBER(11) NOT NULL,
raid_points NUMBER(11) NOT NULL,
defending_points NUMBER(11) NOT NULL,
clock_in_seconds NUMBER(11) NOT NULL,
team_one_score NUMBER(11) NOT NULL,
team_two_score NUMBER(11) NOT NULL,
CONSTRAINT pk_event PRIMARY KEY(id),
CONSTRAINT fk_event_innings FOREIGN KEY(innings_id) REFERENCES innings(id),
CONSTRAINT fk_event_raider FOREIGN KEY(raider_id) REFERENCES player(id)
);
-- 10. **Create table extra_event**
Create Table extra_event
(
id NUMBER(11),
event_id NUMBER(11) NOT NULL,
extra_type_id NUMBER(11) NOT NULL,
points NUMBER(11) NOT NULL,
scoring_team_id NUMBER(11) NOT NULL,
CONSTRAINT pk_extra_event PRIMARY KEY(id),
CONSTRAINT fk_extra_event_event FOREIGN KEY(event_id) REFERENCES event(id),
CONSTRAINT fk_extra_event_raider FOREIGN KEY(extra_type_id) REFERENCES extra_type(id)
);
-- 11. **Create table outcome**
Create Table outcome
(
id NUMBER(11),
status VARCHAR(100) NOT NULL,
winner_team_id NUMBER(11),
score NUMBER(11),
player_of_match NUMBER(11),
CONSTRAINT pk_outcome PRIMARY KEY(id),
CONSTRAINT fk_outcome_winner FOREIGN KEY(winner_team_id) REFERENCES team(id),
CONSTRAINT fk_outcome_player FOREIGN KEY(player_of_match) REFERENCES player(id)
);
-- 12. **Create table game**
Create Table game
(
id NUMBER(11),
game_date DATE NOT NULL,
team_id_1 NUMBER(11) NOT NULL,
team_id_2 NUMBER(11) NOT NULL,
venue_id NUMBER(11) NOT NULL,
outcome_id NUMBER(11) NOT NULL,
referee_id_1 NUMBER(11) NOT NULL,
referee_id_2 NUMBER(11) NOT NULL,
first_innings_id NUMBER(11) NOT NULL,
second_innings_id NUMBER(11) NOT NULL,
CONSTRAINT pk_game PRIMARY KEY(id),
CONSTRAINT fk_game_team_id_1 FOREIGN KEY(team_id_1) REFERENCES team(id),
CONSTRAINT fk_game_team_id_2 FOREIGN KEY(team_id_2) REFERENCES team(id),
CONSTRAINT fk_game_venue FOREIGN KEY(venue_id) REFERENCES venue(id),
CONSTRAINT fk_game_outcome_id FOREIGN KEY(outcome_id) REFERENCES outcome(id),
CONSTRAINT fk_game_refree_id_1 FOREIGN KEY(referee_id_1) REFERENCES referee(id),
CONSTRAINT fk_game_refree_id_2 FOREIGN KEY(referee_id_2) REFERENCES referee(id),
CONSTRAINT fk_game_first FOREIGN KEY(first_innings_id) REFERENCES innings(id),
CONSTRAINT fk_game_second FOREIGN KEY(second_innings_id) REFERENCES innings(id)
);
-- 13. **Drop table city** 
Drop Table city;
-- 14. **Drop table innings**
Drop Table innings;
-- 15. **Drop table skill**
Drop Table skill;
-- 16. **Drop table extra_type**
Drop Table extra_type;
