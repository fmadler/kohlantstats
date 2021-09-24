use kohlantstats
;
show tables
;

set lower_case_table_names=1 
;

select * from GS_GAME
;

select 
prg.NAME program_name,
	pl.name player_name, 
    pl.web_path player_web_path,
    p.ID participant_id,
    t.NAME,
    tet.NAME,
    t.FROM_TIME_UNIT,
    tdt.NAME,
    t.TO_TIME_UNIT
from 
 GS_PROGRAM prg,
 GS_PLAYER pl, GS_PARTICIPANT p, GS_PARTICIPANT_TEAM pt, GS_TEAM t, GS_TEAM_ENTRANCE_TYPE tet, GS_TEAM_DEPARTURE_TYPE tdt
 where 
	p.GS_PLAYER_ID = pl.ID and 
    pt.GS_PARTICIPANT_ID = p.ID and 
    p.GS_PROGRAM_ID = prg.ID and
    pt.GS_TEAM_ID = t.ID and 
    pt.GS_TEAM_ENTRANCE_TYPE_ID = tet.ID and 
    pt.GS_TEAM_DEPARTURE_TYPE_ID = tdt.ID
;

-- distinct teams
select distinct
	prg.NAME program_name,
    prg.WEB_PATH program_web_path,
    t.NAME team_name,
    t.WEB_PATH team_web_path,
    td.FROM_TIME_UNIT team_from_time,
    td.TO_TIME_UNIT team_to_time,
	pl.name player_name, 
    pl.web_path player_web_path,
    p.ID participant_id,
    tet.NAME team_player_entrance_type,
    pt.FROM_TIME_UNIT team_player_from_time,
    tdt.NAME team_player_departure_type,
    pt.TO_TIME_UNIT team_player_to_time
from 
	GS_PROGRAM prg,
	GS_PLAYER pl, 
	GS_PARTICIPANT p, 
	GS_PARTICIPANT_TEAM pt, 
	GS_TEAM t, 
	GS_TEAM_DURATION td, 
	GS_TEAM_ENTRANCE_TYPE tet, 
	GS_TEAM_DEPARTURE_TYPE tdt
where 
	p.GS_PLAYER_ID = pl.ID and 
    pt.GS_PARTICIPANT_ID = p.ID and 
    p.GS_PROGRAM_ID = prg.ID and
    pt.GS_TEAM_ID = t.ID and 
    t.GS_TEAM_DURATION_ID = td.ID and
    pt.GS_TEAM_ENTRANCE_TYPE_ID = tet.ID and 
    pt.GS_TEAM_DEPARTURE_TYPE_ID = tdt.ID
;


-- 

select 
	pl.name player_name, 
    pl.web_path player_web_path,
    sp.PROPERTY property,
    sp.ICON icon,
    sp.UNIT unit,
    s.VALUE property_value

 from gs_program pr, gs_player pl, gs_participant pa, gs_ev_store s, gs_ev_store_property sp
where
pa.GS_PROGRAM_ID = pr.ID and pa.GS_PLAYER_ID = pl.ID and pl.ID = s.ENTITY_ID and s.ENTITY_TYPE = 'player' and s.PROPERTY_ID = sp.ID
/*
$whereProgramWebPath
$wherePlayerWebPath
*/

--
-- Participant global info
--
/*
Nb éditions,
Nb jours dans l'aventure (global, par édition)
Nb de victoires (par equipe, en individuel)
Nb de votes contre/pour lui

*/


-- fun
/*
je suis superstitieux:
nb de victoires jaunes, rouges
les poteaux : nb rouges, jaunes
l'orientation, les finalistes, le vainqueur

quelles chances de remporter une immunité après un confort : en équipe, en indivuel

vote, hasard (boule noire)

*/