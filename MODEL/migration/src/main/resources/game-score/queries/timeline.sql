-- timeline
-- graphical representation https://bootsnipp.com/snippets/Q0ppE

-- collect information by day of adventure
-- info from :
--   participant order by day / participant
--   team
--   game
--   vote
--   durable rewards (kit pêche)

-- union of the timelines

-- global time line (team, winner loser)
-- rewards


-- team:
select  
	t.id,
	t.name team_name,
	t.web_path team_web_path,
    td.FROM_TIME_UNIT team_from_time,
    td.TO_TIME_UNIT team_to_time,
    pxt.FROM_TIME_UNIT participant_from_time,
    pxt.TO_TIME_UNIT participant_to_time,
    pl.NAME participant_name,
    pl.WEB_PATH participant_web_path,
    tet.NAME entrance_type_name,
    tet.WEB_PATH entrance_type_web_path,
    tdt.NAME departure_type_name,
    tdt.WEB_PATH departure_type_web_path 
from 
	gs_team t,
    gs_team_duration td,
    gs_participant_team pxt,
    gs_participant p,
    gs_player pl,
    gs_team_entrance_type tet,
    gs_team_departure_type tdt
where
	pxt.GS_PARTICIPANT_ID = p.ID and 
    pxt.GS_TEAM_ID = t.ID and
    t.GS_TEAM_DURATION_ID= td.ID and
	p.GS_PLAYER_ID = pl.ID and
    pxt.GS_TEAM_ENTRANCE_TYPE_ID = tet.ID and
    pxt.GS_TEAM_DEPARTURE_TYPE_ID = tdt.ID
    
;

-- team timeline is the serie of occurencies when something (entry, exit) happens in the team
-- here they are 2 event entry/exit => union of 2 queries order by time_unit

-- entry
select 
*
from
(
select  
	pxt.id,
    pr.WEB_PATH program_web_path,
	t.name team_name,
	t.web_path team_web_path,
	td.FROM_TIME_UNIT team_from_time,
    td.TO_TIME_UNIT team_to_time,
    pxt.FROM_TIME_UNIT time_unit,
    pl.NAME participant_name,
    pl.WEB_PATH participant_web_path,
	'entrance' event_type,
    tet.NAME event_type_name,
    tet.WEB_PATH event_type_web_path
from 
	gs_team t,
    gs_program pr,
	gs_team_duration td,
    gs_participant_team pxt,
    gs_participant p,
    gs_player pl,
    gs_team_entrance_type tet
where
	pxt.GS_PARTICIPANT_ID = p.ID and
    t.GS_PROGRAM_ID = pr.id and
    t.GS_TEAM_DURATION_ID= td.ID and
    pxt.GS_TEAM_ID = t.ID and
	p.GS_PLAYER_ID = pl.ID and
    pxt.GS_TEAM_ENTRANCE_TYPE_ID = tet.ID 
union
select  
	pxt.id,
    pr.WEB_PATH program_web_path,
	t.name team_name,
	t.web_path team_web_path,
    td.FROM_TIME_UNIT team_from_time,
    td.TO_TIME_UNIT team_to_time,
    pxt.TO_TIME_UNIT time_unit,
    pl.NAME participant_name,
    pl.WEB_PATH participant_web_path,
	'departure' event_type,
    tdt.NAME event_type_name,
    tdt.WEB_PATH event_type_web_path
from 
	gs_team t,
    gs_program pr,
    gs_team_duration td,
    gs_participant_team pxt,
    gs_participant p,
    gs_player pl,
    gs_team_departure_type tdt
where
	pxt.GS_PARTICIPANT_ID = p.ID and
    t.GS_PROGRAM_ID = pr.id and
    t.GS_TEAM_DURATION_ID= td.ID and
    pxt.GS_TEAM_ID = t.ID and
	p.GS_PLAYER_ID = pl.ID and
    pxt.GS_TEAM_DEPARTURE_TYPE_ID = tdt.ID 
    
    ) xx
order by time_unit asc
;



