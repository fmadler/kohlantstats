-- distinct queries serving as input for others

SELECT distinct edition_number, year, name, web_path FROM gs_program ORDER by edition_number asc
;

SELECT p.edition_number, p.year, p.name, p.web_path, p.TOTAL_TIME_LENGTH, l.COUNTRY, l.COUNTRY_FLAG, l.COUNTRY_WEB_PATH, count(p.ID) nb_of_participants 
FROM gs_program p, gs_location l, gs_participant pa 
where
p.GS_LOCATION_ID = l.ID and pa.GS_PROGRAM_ID = p.ID
group by p.edition_number  
ORDER by edition_number asc
;
-- distinct_teams
SELECT distinct t.name, t.web_path FROM gs_team t, gs_program p where t.GS_PROGRAM_ID = p.ID and p.web_path = 'les-quatre-terres' ORDER by t.name asc
;

-- distinct_participants
SELECT distinct pl.name, pl.web_path FROM gs_participant pt, gs_player pl , gs_program p 
where pt.GS_PROGRAM_ID = p.ID 
and pt.GS_PLAYER_ID = pl.ID
and p.web_path = 'les-quatre-terres' 
ORDER by pl.name asc
;

-- distinct_participants for player
SELECT distinct p.name program_name, p.web_path program_web_path, pl.name, pl.web_path 
FROM gs_participant pt, gs_player pl , gs_program p 
where pt.GS_PROGRAM_ID = p.ID 
and pt.GS_PLAYER_ID = pl.ID
and p.ID in (
	select distinct p.id from gs_program p, gs_participant pt, gs_player pl
    where pt.GS_PROGRAM_ID = p.ID 
	and pt.GS_PLAYER_ID = pl.ID 
    and pl.WEB_PATH = 'alix-2020'
)
and pl.WEB_PATH != 'alix-2020'
ORDER by p.EDITION_NUMBER, pl.name asc
;

-- distinct_concurrents_for_game
SELECT p.name program_name, p.web_path program_web_path, g.name game_name, g.web_path game_web_path, pl.name, pl.web_path 
FROM gs_participant pt, gs_player pl , gs_program p, gs_participant_x_game pxg, gs_game g 
where pt.GS_PROGRAM_ID = p.ID 
and pt.GS_PLAYER_ID = pl.ID
and pxg.GS_PARTICIPANT_ID = pt.ID
and pxg.GS_GAME_ID = g.ID 
-- and g.WEB_PATH = 'figure-de-proue-2020'
ORDER by p.EDITION_NUMBER, pl.name asc
;




-- distinct games
SELECT distinct g.name, g.web_path FROM gs_participant pt, gs_game g , gs_participant_x_game pxg, gs_program p 
where pt.GS_PROGRAM_ID = p.ID 
and pxg.GS_GAME_ID = g.ID
and pxg.GS_PARTICIPANT_ID = p.ID
and p.web_path = 'les-quatre-terres' 
ORDER by g.TIME_UNIT_INDEX asc
;