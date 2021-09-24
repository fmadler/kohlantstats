-- vote

select 
	v.id,
	p.name program_name,
	p.web_path program_web_path,
	t.name team_name,	
	t.web_path team_web_path,
	vt.name vote_type_name,
	vt.web_path vote_type_web_path,
	vet.name vote_effectiveness_type_name,
	vet.web_path vote_effectiveness_type_web_path,
	pl1.name voter_name,
	pl1.web_path voter_web_path,
	pl2.name voter_target_name,
	pl2.web_path voter_target_web_path,
	v.sequence,
	v.time_unit,
	v.vote_number 
from 
	gs_vote v,
	gs_team t,
	gs_program p,
	gs_participant p1,
	gs_player pl1,
	gs_participant p2,
	gs_player pl2,
	gs_vote_effectiveness_type vet,
	gs_vote_type vt
where
	v.gs_vote_effectiveness_type_id = vet.id and
	v.gs_vote_type_id = vt.id and
	v.gs_team_id = t.id and
	t.gs_program_id = p.id and
	v.gs_voter_participant_id = p1.id and
	p1.gs_player_id = pl1.id and
	v.gs_voter_target_participant_id = p2.id and
	p2.gs_player_id = pl2.id
;

SELECT concat('v.',lower(COLUMN_NAME),',') col
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = 'kohlantstats' AND TABLE_NAME = 'gs_vote';