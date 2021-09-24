-- quizz_winner_team_option
create or replace view quizz_winner_team_option_v as
select
    p.name program_name,
    p.web_path program_web_path,
    g.name game_name,
    g.web_path game_web_path,
    t.name team_name,
    t.web_path team_web_path,
    ranking,
    case when ranking = 1 then 1 else RAND(6) end as score
from
    gs_game g, gs_team t, gs_team_x_game txg, gs_program p
where
        t.ID = txg.GS_TEAM_ID and g.ID = txg.GS_GAME_ID and g.GS_PROGRAM_ID = p.ID
  and exists (
        select txg.GS_GAME_ID, count(*) from gs_team t, gs_team_x_game txg
        where t.ID = txg.GS_TEAM_ID and g.ID = txg.GS_GAME_ID
        group by txg.GS_GAME_ID
        having count(*) > 1
    )
;
create or replace view quizz_winner_team_filter_matrix_v as
select distinct game_name, game_web_path, program_name, program_web_path from 
quizz_winner_team_option_v
;

-- quizz_participation_option
create or replace view quizz_participation_option_v as
select
	pl.name participant_name,
	pl.web_path participant_web_path,
	g.name game_name,
	g.web_path game_web_path,
	pg.name program_name,
	pg.web_path program_web_path,
	ranking,
	case when ranking = 1 then 1 else RAND(6) end as score
from
	gs_player pl,
	gs_participant pa,
	gs_program pg,
	(
		select g.ID, g.GS_PROGRAM_ID, g.NAME, g.WEB_PATH, count(*) nb_of_winners from gs_game g, gs_participant_x_game pxg
		where pxg.GS_GAME_ID = g.ID and pxg.ranking = 1
		group by g.ID, g.NAME, g.WEB_PATH, g.GS_PROGRAM_ID
	) g,
	gs_team t,
	gs_participant_x_game pxg,
	gs_game_participation_type gpt
where
	pa.gs_player_id = pl.id and
	pa.gs_program_id = pg.id and
	pxg.gs_team_id = t.id and
	pxg.GS_GAME_ID = g.ID and
	pxg.GS_PARTICIPANT_ID = pa.ID and
	g.gs_program_id = pg.id and
	pxg.gs_game_participation_type_id = gpt.id
;
create or replace view quizz_participation_filter_matrix_v as 
select distinct game_name, game_web_path, program_name, program_web_path from 
quizz_participation_option_v
;

-- quizz_sort_team_member_option

create or replace view quizz_sort_team_member_option_v as
select
    pg.name program_name,
    pg.web_path program_web_path,
    pg.EDITION_NUMBER,
    g.name game_name,
    g.web_path game_web_path,
    g.TIME_POSITION,
    t.name team_name,
    t.web_path team_web_path,
    pl.name participant_name,
    pl.web_path participant_web_path,
    gat.WEB_PATH game_activity_type_web_path
from
    gs_participant_x_game pxg,
    gs_game g,
    gs_team t,
    gs_program pg,
    gs_game_participation_type gpt,
    gs_game_activity_type gat,
    gs_participant pa,
    gs_player pl
where
        pxg.gs_game_id = g.ID and
        pxg.gs_team_id = t.ID and
        pxg.GS_PARTICIPANT_ID = pa.ID and
        pxg.GS_GAME_ACTIVITY_TYPE_ID = gat.ID and
        pa.GS_PLAYER_ID = pl.ID and
        g.gs_program_id = pg.ID and
        g.GS_GAME_PARTICIPATION_TYPE_ID = gpt.ID and
        gpt.WEB_PATH = 'collectif'
;
create or replace view quizz_sort_team_member_filter_matrix_v as
select distinct game_name, game_web_path, program_name, program_web_path from 
quizz_sort_team_member_option_v
;

-- quizz_winner_participant_order_option
create or replace view quizz_winner_participant_order_option_v
as
select
    g.name game_name,
    g.web_path game_web_path,
    pg.name program_name,
    pg.web_path program_web_path,
    pl.name participant_name,
    pl.web_path participant_web_path,
    pxg.ranking ranking
from
    gs_participant_x_game pxg,
    gs_game g,
    gs_program pg,
    gs_participant p,
    gs_player pl,
    gs_game_participation_type gpt
where
        pxg.gs_game_id = g.ID and
        pxg.GS_PARTICIPANT_ID = p.ID and
        g.gs_program_id = pg.ID and
        p.GS_PLAYER_ID = pl.ID and
        g.GS_GAME_PARTICIPATION_TYPE_ID = gpt.ID and
        gpt.WEB_PATH = 'individuel' and
    pxg.RANKING between 1 and 3
  and g.ID in (select g.ID from gs_participant_x_game pxg, gs_game g
               where pxg.GS_GAME_ID = g.ID and pxg.RANKING < 4 and pxg.RANKING > 0
               group by g.id
               having count(*) between 2 and 3
)
;
create or replace view quizz_winner_participant_order_filter_matrix_v as
select distinct game_name, game_web_path, program_name, program_web_path from 
quizz_winner_participant_order_option_v
;

-- quizz_winner_team_order_option
create or replace view quizz_winner_team_order_option_v
as
select
    pg.name program_name,
    pg.web_path program_web_path,
    pg.EDITION_NUMBER,
    g.name game_name,
    g.web_path game_web_path,
    g.TIME_POSITION,
    t.name team_name,
    t.web_path team_web_path,
    txg.ranking ranking
from
    gs_team_x_game txg,
    gs_game g,
    gs_team t,
    gs_program pg,
    gs_game_participation_type gpt
where
        txg.gs_game_id = g.ID and
        txg.GS_TEAM_ID = t.ID and
        g.gs_program_id = pg.ID and
        g.GS_GAME_PARTICIPATION_TYPE_ID = gpt.ID and
        gpt.WEB_PATH = 'collectif' and
    txg.RANKING between 1 and 3
  and g.ID in (select g.ID from gs_team_x_game txg, gs_game g
               where txg.GS_GAME_ID = g.ID and txg.RANKING < 4 and txg.RANKING > 0
               group by g.id
               having count(*) between 2 and 3
)
;
create or replace view quizz_winner_team_order_filter_matrix_v as
select distinct game_name, game_web_path, program_name, program_web_path from 
quizz_winner_team_order_option_v
;