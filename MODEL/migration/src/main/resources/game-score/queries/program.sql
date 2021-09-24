-- programme

select p.name, p.web_path, p.year,
	p.EDITION_NUMBER EDITION_NUMBER,
    p.TOTAL_TIME_LENGTH,
    l.COUNTRY,
    l.COUNTRY_FLAG,
    l.COUNTRY_WEB_PATH,
    l.LATITUDE,
    l.LONGITUDE,
    winner.name winner_name,
    winner.WEB_PATH winner_web_path,
    participants.nb nb_of_participants
 from gs_program p, gs_location l,
 (
select max(nb), name, web_path, program_web_path from (
select 
	count(*) nb, 
    pl.name name,
    pl.web_path web_path,
	pg.WEB_PATH program_web_path
from gs_vote v, gs_vote_type vt, gs_participant pa, gs_player pl, gs_program pg
where 
v.GS_VOTE_TYPE_ID = vt.ID and
v.gs_voter_target_participant_id = pa.id and
pa.GS_PLAYER_ID = pl.id and
pa.GS_PROGRAM_ID = pg.ID and
vt.web_path = 'vote-pour'
group by pg.web_path, pl.web_path
) yy group by program_web_path
) winner,
(

select count(*) nb, pg.WEB_PATH program_web_path from gs_participant pa, gs_program pg
where pa.GS_PROGRAM_ID = pg.ID
group by pg.web_path
)participants
where 
	p.GS_LOCATION_ID = l.ID and
    p.web_path = winner.program_web_path and
    p.web_path = participants.program_web_path
order by edition_number
;
--
-- add nb épreuves, nb concurrents, vainqueur, nb d'abondon

select count(*) nb, pg.WEB_PATH from gs_participant pa, gs_program pg
where pa.GS_PROGRAM_ID = pg.ID
group by pg.web_path
;

select * from gs_vote v, gs_vote_type vt
where vt.web_path = 'vote-contre'
;

select max(nb), name, web_path, program_web_path from (
select 
	count(*) nb, 
    pl.name,
    pl.web_path,
	pg.WEB_PATH program_web_path
from gs_vote v, gs_vote_type vt, gs_participant pa, gs_player pl, gs_program pg
where 
v.GS_VOTE_TYPE_ID = vt.ID and
v.gs_voter_target_participant_id = pa.id and
pa.GS_PLAYER_ID = pl.id and
pa.GS_PROGRAM_ID = pg.ID and
vt.web_path = 'vote-pour'
group by pg.web_path, pl.web_path
) yy group by program_web_path
;
select 
	count(*) nb, 
	pl.name, 
	pl.WEB_PATH, 
	pg.WEB_PATH program_web_path
from gs_vote v, gs_vote_type vt, gs_participant pa, gs_player pl, gs_program pg
where 
v.GS_VOTE_TYPE_ID = vt.ID and
v.gs_voter_target_participant_id = pa.id and
pa.GS_PLAYER_ID = pl.id and
pa.GS_PROGRAM_ID = pg.ID and
vt.web_path = 'vote-pour'
group by pl.name, pg.web_path

;


-- parcours
select max(to_time_unit) _max, pl.name participant_name, pl.WEB_PATH participant_web_path,
tdt.NAME, tdt.web_path, pg.web_path
from gs_participant pa, gs_player pl, gs_participant_team pxt, gs_team_departure_type tdt, gs_program pg
where
pa.GS_PLAYER_ID = pl.id and
pxt.GS_PARTICIPANT_ID = pa.id and
pxt.GS_TEAM_DEPARTURE_TYPE_ID = tdt.ID and
pa.GS_PROGRAM_ID = pg.ID 
group by pl.name, pg.web_path
;
-- parcours
select pl.name participant_name, pl.WEB_PATH participant_web_path, to_time_unit,
tdt.NAME, tdt.web_path, pg.web_path
from gs_participant pa, gs_player pl, gs_participant_team pxt, gs_team_departure_type tdt, gs_program pg
where
pa.GS_PLAYER_ID = pl.id and
pxt.GS_PARTICIPANT_ID = pa.id and
pxt.GS_TEAM_DEPARTURE_TYPE_ID = tdt.ID and
pa.GS_PROGRAM_ID = pg.ID 
order by pl.name, to_time_unit
;