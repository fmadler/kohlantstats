-- stats
-- tops participants sur les épreuves , total, confort, totem, collectif, indiv, binôme / nb effectuées & !! game skills
-- to display in participant details
-- to display in program details
-- to display in wall of fame - goat

	/*
	GROUP_CONCAT(distinct
				CONCAT_WS(
				'|',
				winery_name,
				winery_web_path,
				region_web_path,
				country_web_path
				)
				order by w_ID
				) exhibitor_details,
				*/

-- tops participants sur les épreuves , total, confort, totem, collectif, indiv, binôme / nb effectuées & !! game skills
-- participant 
select
participant_name,
participant_web_path,
program_name,
program_web_path,
sum(totem) totems,
sum(totem_individual) totems_individual,
sum(confort) conforts,
sum(confort_individual) conforts_individual,
sum(ranking_1)  ranking_1,
sum(ranking_2)  ranking_2,
sum(ranking_3)  ranking_3,
sum(ranking_other) ranking_other,
sum(ranking_1_alone)  ranking_1_alone,
sum(ranking_2_alone)  ranking_2_alone,
sum(ranking_3_alone)  ranking_3_alone,
sum(ranking_other_alone) ranking_other_alone,
count(distinct game_name) nb_of_games,
sum(individual_game_last) individual_game_lasts,
sum(active_participantion) active_participations,
sum(individual_game) individual_participations,
GROUP_CONCAT(distinct
				CONCAT_WS(
				'|',
				game_name,
                game_web_path,
                program_index,
				activity_type_name,
                participation_type_name,
                game_stake_type_name,
                ranking
				)
				order by program_index
				) participation_details
from (
	select 	
	pl.name participant_name,
	pl.WEB_PATH participant_web_path,
	pxg.RANKING ranking,
	case when pxg.RANKING = 1 then 1 else 0 end ranking_1,
	case when pxg.RANKING = 2 then 1 else 0 end ranking_2,
	case when pxg.RANKING = 3 then 1 else 0 end ranking_3,
	case when pxg.RANKING > 3 or pxg.RANKING = 0 then 1 else 0 end ranking_other,
	case when pxg.RANKING = 1 and gpt.WEB_PATH = 'individuel' then 1 else 0 end ranking_1_alone,
	case when pxg.RANKING = 2 and gpt.WEB_PATH = 'individuel' then 1 else 0 end ranking_2_alone,
	case when pxg.RANKING = 3 and gpt.WEB_PATH = 'individuel' then 1 else 0 end ranking_3_alone,
    case when (pxg.RANKING > 3 or pxg.RANKING = 0) and gpt.WEB_PATH = 'individuel' then 1 else 0 end ranking_other_alone,
    case when gst.WEB_PATH = 'immunite' and pxg.ranking = 1 then 1 else 0 end totem,
    case when gst.web_path = 'immunite' and gpt.WEB_PATH = 'individuel' and pxg.ranking = 1 then 1 else 0 end totem_individual,
	case when gst.WEB_PATH = 'confort' and pxg.ranking = 1 then 1 else 0 end confort,
    case when gst.web_path = 'confort' and gpt.WEB_PATH = 'individuel' and pxg.ranking = 1 then 1 else 0 end confort_individual,
    case when gpt.WEB_PATH = 'individuel' then 1 else 0 end individual_game,
    case when gpt.WEB_PATH = 'individuel' and max_ranking=pxg.ranking and nb_register_participants=pxg.ranking then 1 else 0 end individual_game_last,
    case when gat.web_path = 'participant' then 1 else 0 end active_participantion,
    gat.name activity_type_name, gat.web_path activity_type_web_path,
	g.program_index program_index,
	g.name game_name,
	g.web_path game_web_path,
	gt.name game_type_name,
	gt.web_path game_type_web_path,
	gst.name game_stake_type_name,
	gst.web_path game_stake_type_web_path,
	gpt.name participation_type_name,
	gpt.web_path participation_type_web_path,
	p.name program_name,
	p.web_path program_web_path
	from gs_game g, gs_team t, gs_participant_x_game pxg, gs_game_type gt, gs_game_stake_type gst, gs_program p, gs_participant pa, gs_player pl, GS_GAME_PARTICIPATION_TYPE gpt, GS_GAME_ACTIVITY_TYPE gat
		, (    
		select max(pxg.ranking) max_ranking, count(*) nb_register_participants, g.id from gs_game g, gs_participant_x_game pxg
			where
		pxg.GS_GAME_ID = g.ID 
		group by g.id
		order by g.id
    ) aaa
    where
	pxg.GS_GAME_ID = g.ID and
    pxg.gs_team_id = t.id and
	pxg.GS_PARTICIPANT_ID = pa.ID and
	pa.GS_PROGRAM_ID = p.ID and
	g.GS_GAME_TYPE_ID = gt.id and 
	g.GS_GAME_STAKE_TYPE_ID = gst.ID and
	pa.GS_PLAYER_ID = pl.ID and
    pxg.GS_GAME_PARTICIPATION_TYPE_ID = gpt.ID and
    pxg.GS_GAME_ACTIVITY_TYPE_ID = gat.ID and
    aaa.id = g.id
    
    and t.WEB_PATH = 'blanc-2020'
) xxx

group by 
participant_name,
participant_web_path,
program_name,
program_web_path
order by
ranking_1 desc, ranking_2 desc, ranking_3 desc
;


-- order by pxg.ranking
/*
select count(*) from gs_game
;
*/

	select 	
    g.name g_name,
	pl.name participant_name,
	pl.WEB_PATH participant_web_path,
	pxg.RANKING ranking,
	case when pxg.RANKING = 1 then 1 else 0 end ranking_1,
	case when pxg.RANKING = 2 then 1 else 0 end ranking_2,
	case when pxg.RANKING = 3 then 1 else 0 end ranking_3,
     case when pxg.RANKING > 3 or pxg.RANKING = 0 then 1 else 0 end ranking_other,
	case when pxg.RANKING = 1 and gpt.WEB_PATH = 'individuel' then 1 else 0 end ranking_1_alone,
	case when pxg.RANKING = 2 and gpt.WEB_PATH = 'individuel' then 1 else 0 end ranking_2_alone,
	case when pxg.RANKING = 3 and gpt.WEB_PATH = 'individuel' then 1 else 0 end ranking_3_alone,
    case when (pxg.RANKING > 3 or pxg.RANKING = 0) and gpt.WEB_PATH = 'individuel' then 1 else 0 end ranking_other_alone,
    case when gst.WEB_PATH = 'immunite' and pxg.ranking = 1 then 1 else 0 end totem,
    case when gst.web_path= 'immunite' and gpt.WEB_PATH = 'individuel' and pxg.ranking = 1 then 1 else 0 end totem_individual,
	case when gpt.WEB_PATH = 'individuel' and max_ranking=pxg.ranking and nb_register_participants=pxg.ranking then 1 else 0 end individual_game_last,
    case when gpt.WEB_PATH = 'individuel' then 1 else 0 end individual_game,
    case when gat.web_path = 'participant' then 1 else 0 end active_participantion,
    gat.name activity_type_name, gat.web_path activity_type_web_path,
	g.program_index program_index,
	g.name game_name,
	g.web_path game_web_path,
	gt.name game_type_name,
	gt.web_path game_type_web_path,
	gst.name game_stake_type_name,
	gst.web_path game_stake_type_web_path,
	gpt.name participation_type_name,
	gpt.web_path participation_type_web_path,
	p.name program_name,
	p.web_path program_web_path
	from gs_game g, gs_participant_x_game pxg, gs_game_type gt, gs_game_stake_type gst, gs_program p, gs_participant pa, gs_player pl, GS_GAME_PARTICIPATION_TYPE gpt, GS_GAME_ACTIVITY_TYPE gat
	, (    
		select max(pxg.ranking) max_ranking, count(*) nb_register_participants, g.id from gs_game g, gs_participant_x_game pxg
			where
		pxg.GS_GAME_ID = g.ID 
		group by g.id
		order by g.id
    ) aaa
    where
	pxg.GS_GAME_ID = g.ID and
	pxg.GS_PARTICIPANT_ID = pa.ID and
	pa.GS_PROGRAM_ID = p.ID and
	g.GS_GAME_TYPE_ID = gt.id and 
	g.GS_GAME_STAKE_TYPE_ID = gst.ID and
	pa.GS_PLAYER_ID = pl.ID and
    pxg.GS_GAME_PARTICIPATION_TYPE_ID = gpt.ID and
    pxg.GS_GAME_ACTIVITY_TYPE_ID = gat.ID and 
    aaa.id = g.id
    
    -- and pl.WEB_PATH in ('alexandra-2020','loic-2020')
    order by g.name, pl.name
    ;
    
    --
    select max(pxg.ranking) max_ranking, count(*) nb_register_participants, g.id, g.name from gs_game g, gs_participant_x_game pxg
    	where
	pxg.GS_GAME_ID = g.ID 
    group by g.id
    order by g.id
    ;