-- teams
/*							<query refid="team_info" result-cardinality="one" holder="false"></query>
--							<query refid="distinct_teams" result-cardinality="one" holder="false"></query>
--							<query refid="game_stats" result-cardinality="many" holder="false"></query>
*/

-- team_info
-- nb participant / jour / nb resultats confort 

-- jody,brice,estelle, 5 (jour), bamboo-2020, 3 (eme)

-- from stats

select 
	p.name program_name,
	p.web_path program_web_path,
    t.name team_name,
    t.WEB_PATH team_web_path,
    g.name game_name,
	g.web_path game_web_path,
    GROUP_CONCAT(distinct
				CONCAT_WS(
				'|',
				pl.WEB_PATH,
                pl.NAME,
                pxg.RANKING
				)
				order by pl.NAME
				) team_details,
	count(pl.WEB_PATH) nb_players,
    xxx.nb_teams,
    case when xxx.winner_team_id = t.id then 1 else 0 end is_winner,
    xxx.winner_team_web_path,
    xxx.winner_participant_web_paths,
	g.program_index program_index,
    g.TIME_POSITION TIME_POSITION,
	gt.name game_type_name,
	gt.web_path game_type_web_path,
	gst.name game_stake_type_name,
	gst.web_path game_stake_type_web_path,
	gpt.name participation_type_name,
	gpt.web_path participation_type_web_path
	from gs_game g, gs_team t, gs_participant_x_game pxg, gs_game_type gt, gs_game_stake_type gst, gs_program p, gs_participant pa, gs_player pl, GS_GAME_PARTICIPATION_TYPE gpt, GS_GAME_ACTIVITY_TYPE gat
	, (    
 select 
 aaa.nb_teams nb_teams,
 aaa.program_id,
 aaa.game_id,
 winner_team.team_id winner_team_id,
 winner_team.team_web_path winner_team_web_path,
 winner_participant.players winner_participant_web_paths
 from 
 (
   select count(distinct t.ID) nb_teams, p.ID program_id, g.PROGRAM_INDEX, g.id game_id
 from  gs_team t, gs_game g, gs_participant_x_game pxg, gs_program p
 where t.GS_PROGRAM_ID = p.ID and pxg.gs_team_id = t.id and pxg.GS_GAME_ID = g.ID
 group by program_id, g.PROGRAM_INDEX
 ) aaa,
 (
   select distinct t.ID team_id, t.WEB_PATH team_web_path, g.ID game_id, PROGRAM_INDEX
 from  gs_team t, gs_game g, gs_participant_x_game pxg, gs_program p
 where t.GS_PROGRAM_ID = p.ID and pxg.gs_team_id = t.id and pxg.GS_GAME_ID = g.ID
 and pxg.ranking = 1
 ) winner_team,
  (
   select 
       GROUP_CONCAT(distinct
				CONCAT_WS(
				'|',
				pl.WEB_PATH,
                pl.NAME
				)
				order by pl.NAME
				) players,
   g.ID game_id, PROGRAM_INDEX
 from  gs_participant pa, gs_player pl, gs_game g, gs_participant_x_game pxg
 where pxg.GS_PARTICIPANT_ID = pa.id and pa.gs_player_id = pl.id and pxg.GS_GAME_ID = g.ID
 and pxg.ranking = 1
 group by g.id
 ) winner_participant
 where aaa.game_id = winner_team.game_id -- and aaa.PROGRAM_INDEX = winner_team.PROGRAM_INDEX
 and aaa.game_id = winner_participant.game_id
    ) xxx
    where
	pxg.GS_GAME_ID = g.ID and
    pxg.GS_TEAM_ID = t.ID and
	pxg.GS_PARTICIPANT_ID = pa.ID and
	pa.GS_PROGRAM_ID = p.ID and
	g.GS_GAME_TYPE_ID = gt.id and 
	g.GS_GAME_STAKE_TYPE_ID = gst.ID and
	pa.GS_PLAYER_ID = pl.ID and
    pxg.GS_GAME_PARTICIPATION_TYPE_ID = gpt.ID and
    pxg.GS_GAME_ACTIVITY_TYPE_ID = gat.ID and 
    xxx.game_id = g.id
    
    group by program_web_path, program_index, xxx.winner_team_id, team_web_path, game_web_path
    order by p.name, program_index, t.name, g.name, pl.name
    ;
    
    /* 
 select t.ID team_id, p.ID program_id, g.PROGRAM_INDEX
 from  gs_team t, gs_game g, gs_participant_x_game pxg, gs_program p
 where t.GS_PROGRAM_ID = p.ID and pxg.gs_team_id = t.id and pxg.GS_GAME_ID = g.ID
 ;

 select count(distinct t.ID) teams, p.ID program_id, g.PROGRAM_INDEX
 from  gs_team t, gs_game g, gs_participant_x_game pxg, gs_program p
 where t.GS_PROGRAM_ID = p.ID and pxg.gs_team_id = t.id and pxg.GS_GAME_ID = g.ID
 group by program_id, g.PROGRAM_INDEX
 order by g.PROGRAM_INDEX
 ;
 */
  select t.ID team_id, p.ID program_id, g.PROGRAM_INDEX, pxg.ranking,
  case when pxg.ranking = 1 then 1 else 0 end winner,
  gpt.WEB_PATH game_participation_type_web_path
 from  gs_team t, gs_game g, gs_participant_x_game pxg, gs_program p, gs_game_participation_type gpt
 where t.GS_PROGRAM_ID = p.ID and pxg.gs_team_id = t.id and pxg.GS_GAME_ID = g.ID and pxg.GS_GAME_PARTICIPATION_TYPE_ID = gpt.ID
 order by PROGRAM_INDEX
 ;
 
  select count(distinct t.ID) teams, p.ID program_id, g.PROGRAM_INDEX
 from  gs_team t, gs_game g, gs_participant_x_game pxg, gs_program p
 where t.GS_PROGRAM_ID = p.ID and pxg.gs_team_id = t.id and pxg.GS_GAME_ID = g.ID
 group by program_id, g.PROGRAM_INDEX
 order by g.PROGRAM_INDEX
 ;
 
 
 --
 select 
 aaa.nb_teams nb_teams,
 aaa.program_id,
 aaa.game_id,
 winner_team.team_web_path winner_team_web_path 
 from 
 (
   select count(distinct t.ID) nb_teams, p.ID program_id, g.PROGRAM_INDEX, g.id game_id
 from  gs_team t, gs_game g, gs_participant_x_game pxg, gs_program p
 where t.GS_PROGRAM_ID = p.ID and pxg.gs_team_id = t.id and pxg.GS_GAME_ID = g.ID
 group by program_id, g.PROGRAM_INDEX
 ) aaa,
 (
   select distinct t.ID team_id, t.WEB_PATH team_web_path, g.ID game_id, PROGRAM_INDEX
 from  gs_team t, gs_game g, gs_participant_x_game pxg, gs_program p
 where t.GS_PROGRAM_ID = p.ID and pxg.gs_team_id = t.id and pxg.GS_GAME_ID = g.ID
 and pxg.ranking = 1
 ) winner_team
 where aaa.game_id = winner_team.game_id and aaa.PROGRAM_INDEX = winner_team.PROGRAM_INDEX
 order by aaa.PROGRAM_INDEX
 ;
 
 select distinct(team_id), program_id, PROGRAM_INDEX
 from (
   select t.ID team_id, g.ID game_id, PROGRAM_INDEX,
  case when pxg.ranking = 1 then 1 else 0 end winner
 from  gs_team t, gs_game g, gs_participant_x_game pxg, gs_program p
 where t.GS_PROGRAM_ID = p.ID and pxg.gs_team_id = t.id and pxg.GS_GAME_ID = g.ID
 ) aaa
 group by program_id, PROGRAM_INDEX
 order by PROGRAM_INDEX
 
 ;
 
  
 --
 select 
 aaa.nb_teams nb_teams,
 aaa.program_id,
 aaa.game_id,
 winner_team.team_web_path winner_team_web_path,
 winner_participant.players
 from 
 (
   select count(distinct t.ID) nb_teams, p.ID program_id, g.PROGRAM_INDEX, g.id game_id
 from  gs_team t, gs_game g, gs_participant_x_game pxg, gs_program p
 where t.GS_PROGRAM_ID = p.ID and pxg.gs_team_id = t.id and pxg.GS_GAME_ID = g.ID
 group by program_id, g.PROGRAM_INDEX
 ) aaa,
 (
   select distinct t.ID team_id, t.WEB_PATH team_web_path, g.ID game_id, PROGRAM_INDEX
 from  gs_team t, gs_game g, gs_participant_x_game pxg, gs_program p
 where t.GS_PROGRAM_ID = p.ID and pxg.gs_team_id = t.id and pxg.GS_GAME_ID = g.ID
 and pxg.ranking = 1
 ) winner_team,
  (
   select 
       GROUP_CONCAT(distinct
				CONCAT_WS(
				'|',
				pl.WEB_PATH,
                pl.NAME
				)
				order by pl.NAME
				) players,
   g.ID game_id, PROGRAM_INDEX
 from  gs_participant pa, gs_player pl, gs_game g, gs_participant_x_game pxg
 where pxg.GS_PARTICIPANT_ID = pa.id and pa.gs_player_id = pl.id and pxg.GS_GAME_ID = g.ID
 and pxg.ranking = 1
 group by g.id
 ) winner_participant
 where aaa.game_id = winner_team.game_id -- and aaa.PROGRAM_INDEX = winner_team.PROGRAM_INDEX
 and aaa.game_id = winner_participant.game_id
 order by aaa.PROGRAM_INDEX
 ;