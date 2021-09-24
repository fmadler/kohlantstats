-- player camp activity

select 
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
    pt.TO_TIME_UNIT team_player_to_time,
	GROUP_CONCAT(distinct
			CONCAT_WS(
			'|',
			rt.name,
            rt.web_path
			)
			order by gtxr.DISPLAY_ORDER
			) realisations
from 
	GS_PROGRAM prg,
	GS_PLAYER pl, 
	GS_PARTICIPANT p, 
	GS_PARTICIPANT_TEAM pt
		left outer join GS_PARTICIPANT_TEAM_X_REALISATION gtxr on gtxr.GS_PARTICIPANT_TEAM_ID = pt.ID
        left outer join GS_REALISATION_TYPE rt on gtxr.GS_REALISATION_TYPE_ID = rt.id, 
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
group by pt.ID -- , pl.id, p.id
order by pL.name, td.FROM_TIME_UNIT
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