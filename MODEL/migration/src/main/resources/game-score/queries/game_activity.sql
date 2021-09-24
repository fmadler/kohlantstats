-- game activity

select 
	pl.name player_name, 
    pl.web_path player_web_path,
    g.name game_name,
    g.web_path game_web_path,
    dt.distinct_teams distinct_teams,
    t.name team_name,
    t.WEB_PATH team_web_path,
	g.time_position,
    g.TIME_UNIT_INDEX,
    gpt.name participation_type,
    gat.name activity_type,
    pxg.ranking ranking,
    gt.name game_type_name,
    gt.WEB_PATH game_type_web_path,
    gst.name game_stake_type_name,
    gst.WEB_PATH game_stake_type_web_path,
	GROUP_CONCAT(distinct
			CONCAT_WS(
			'|',
			r.name,
            r.web_path,
            r.is_positive
			)
			order by ggxr.DISPLAY_ORDER
			) rewards,
	GROUP_CONCAT(distinct
			CONCAT_WS(
			'|',
			r2.name,
            r2.web_path,
            r2.is_positive
			)
			order by gxr.DISPLAY_ORDER
			) game_rewards
	,GROUP_CONCAT(distinct
			CONCAT_WS(
			'|',
			x.name,
            x.web_path
			)
			order by x.DISPLAY_ORDER
			) game_tags
            
from GS_PARTICIPANT_X_GAME pxg 
		left outer join GS_PARTICIPANT_GAME_X_REWARD ggxr on ggxr.GS_PARTICIPANT_X_GAME_ID = pxg.ID
        left outer join GS_REWARD r on ggxr.GS_REWARD_ID = r.ID,
	gs_program pr, 
    gs_player pl, 
    gs_participant pa, 
    gs_team t, 
    gs_game g 
		left outer join GS_GAME_X_REWARD gxr on gxr.GS_GAME_ID = g.ID
        left outer join GS_REWARD r2 on gxr.GS_REWARD_ID = r2.ID
        left outer join (
			select GS_GAME_ID, DISPLAY_ORDER, gta.NAME, gta.WEB_PATH from GS_GAME_X_TAG gxt,  GS_GAME_TAG gta where gxt.GS_GAME_TAG_ID = gta.ID
            ) x on x.GS_GAME_ID = g.ID,
    GS_GAME_PARTICIPATION_TYPE gpt, 
    GS_GAME_ACTIVITY_TYPE gat,
    GS_GAME_STAKE_TYPE gst,
    GS_GAME_TYPE gt,
    (
		select g.id game_id, count(distinct t.name) distinct_teams from gs_team t, gs_game g, GS_PARTICIPANT_X_GAME pxg
		where
		pxg.gs_team_id = t.id and pxg.gs_game_id = g.id
		group by g.id
	) dt ,
    (
		select g.id game_id, count(distinct p.id) distinct_participants from gs_game g, gs_participant p, GS_PARTICIPANT_X_GAME pxg
		where
		pxg.gs_game_id = g.id and pxg.gs_participant_id = p.id
		and pxg.GS_GAME_ACTIVITY_TYPE_ID = 1
		group by g.id
    ) dp
where
	pxg.GS_Participant_id = pa.ID and
    pxg.GS_GAME_ID = g.ID and
    pxg.GS_TEAM_ID = t.ID and
    pxg.GS_GAME_PARTICIPATION_TYPE_ID = gpt.ID and
    pxg.GS_GAME_ACTIVITY_TYPE_ID = gat.ID and
	pa.GS_PROGRAM_ID = pr.ID and 
	pa.GS_PLAYER_ID = pl.ID and
    g.GS_GAME_STAKE_TYPE_ID = gst.ID and
    g.GS_GAME_TYPE_ID = gt.ID and
    dt.game_id = g.id and
    dp.game_id = g.id
 --   $whereProgramWebPath
 --   $wherePlayerWebPath
 --   $whereGameWebPath
group by pxg.ID
order by g.TIME_UNIT_INDEX
;

select g.id game_id, count(distinct t.name) distinct_teams from gs_team t, gs_game g, GS_PARTICIPANT_X_GAME pxg
where
pxg.gs_team_id = t.id and pxg.gs_game_id = g.id
-- and g.WEB_PATH = 'bamboo-2020'
group by g.id
;

select g.id game_id, count(distinct p.id) distinct_participants from gs_game g, gs_participant p, GS_PARTICIPANT_X_GAME pxg
where
pxg.gs_game_id = g.id and pxg.gs_participant_id = p.id
and pxg.GS_GAME_ACTIVITY_TYPE_ID = 1
-- and g.WEB_PATH = 'bamboo-2020'
group by g.id
;


-- distinct_games

select distinct	
g.name name,
g.web_path WEB_PATH,
g.TIME_POSITION,
g.TIME_UNIT_INDEX,
g.PROGRAM_INDEX,
gt.name game_type_name,
gt.web_path game_type_web_path,
gst.name game_stake_type_name,
gst.web_path game_stake_type_web_path,
p.name program_name,
p.web_path program_web_path

from gs_game g, gs_participant_x_game pxg, gs_game_type gt, gs_game_stake_type gst, gs_program p, gs_participant pa
where
pxg.GS_GAME_ID = g.ID and
pxg.GS_PARTICIPANT_ID = pa.ID and
pa.GS_PROGRAM_ID = p.ID and
g.GS_GAME_TYPE_ID = gt.id and 
g.GS_GAME_STAKE_TYPE_ID = gst.ID
;

-- similar_game_for_other_program	
select distinct	
g.name name,
g.web_path WEB_PATH,
g.TIME_POSITION,
g.TIME_UNIT_INDEX,
g.PROGRAM_INDEX,
gt.name game_type_name,
gt.web_path game_type_web_path,
gst.name game_stake_type_name,
gst.web_path game_stake_type_web_path,
p.name program_name,
p.web_path program_web_path

from gs_game g, gs_participant_x_game pxg, gs_game_type gt, gs_game_stake_type gst, gs_program p, gs_participant pa
where
pxg.GS_GAME_ID = g.ID and
pxg.GS_PARTICIPANT_ID = pa.ID and
pa.GS_PROGRAM_ID = p.ID and
g.GS_GAME_TYPE_ID = gt.id and 
g.GS_GAME_STAKE_TYPE_ID = gst.ID

--
and gt.WEB_PATH = 'poursuite-chargee'

;