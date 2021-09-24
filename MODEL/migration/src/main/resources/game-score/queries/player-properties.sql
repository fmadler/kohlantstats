-- nb victories, nb days, position
select pa.age, pl.name, pl.family_name, pl.sex, pl.BIRTH_date, pa.final_position, xx.nb_victories, yy.max_time
from  gs_player pl, gs_participant pa
left join (
select GS_PARTICIPANT_ID, count(*) nb_victories from gs_participant_x_game pxg where ranking = 1
group by GS_PARTICIPANT_ID

) xx on xx.GS_PARTICIPANT_ID = pa.id
left join (
select GS_PARTICIPANT_ID, max(TO_TIME_UNIT) max_time from GS_PARTICIPANT_TEAM pt 
group by GS_PARTICIPANT_ID
) yy on yy.GS_PARTICIPANT_ID = pa.id
where pa.GS_PLAYER_ID = pl.ID
;

select GS_PARTICIPANT_ID, count(*) nb_victories from gs_participant_x_game pxg where ranking = 1
group by GS_PARTICIPANT_ID
;
select GS_PARTICIPANT_ID, max(TO_TIME_UNIT) from GS_PARTICIPANT_TEAM pt 
group by GS_PARTICIPANT_ID
;


select 
	pl.name player_name, 
    pl.web_path player_web_path,
    g.name game_name,
    g.web_path game_web_path,
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
    GS_GAME_TYPE gt
where
	pxg.GS_Participant_id = pa.ID and
    pxg.GS_GAME_ID = g.ID and
    pxg.GS_TEAM_ID = t.ID and
    pxg.GS_GAME_PARTICIPATION_TYPE_ID = gpt.ID and
    pxg.GS_GAME_ACTIVITY_TYPE_ID = gat.ID and
	pa.GS_PROGRAM_ID = pr.ID and pa.GS_PLAYER_ID = pl.ID and
    g.GS_GAME_STAKE_TYPE_ID = gst.ID and
    g.GS_GAME_TYPE_ID = gt.ID
    and pl.web_path = 'alix-2020'
group by pxg.ID
;
/*
GROUP_CONCAT(distinct
			CONCAT_WS(
			'|',
			event_name,
            event_web_path
			)
			order by e_id
			) Event_details,
            */
--


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