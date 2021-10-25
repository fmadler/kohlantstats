-- store procedure
delimiter $$
drop procedure IF EXISTS vote$$
-- TODO
create procedure vote
(
    _program_web_path varchar(100),
	_voter_web_path varchar(100),
    _voter_target_web_path varchar(100),
    _team_web_path varchar(100),
	_vote_number int,
    _time_unit int,
    _sequence int,
    _vote_effectiveness_type_web_path varchar(100),
    _vote_type_web_path varchar(100)
)
begin
	set @voter_id = null;
    set @voter_target_id = null;
    set @team_id = null;
    set @vote_effectiveness_type_id = null;
    set @vote_type_id = null;
        
    select id into @team_id from gs_team where web_path = _team_web_path;
	IF(@team_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Team not found for ';
	END IF;
    
    /* TODO check that voter and target are from same team */
    select p.id into @voter_id from gs_participant p, gs_player pl, gs_program pr
        where p.GS_PLAYER_ID = pl.id and pl.WEB_PATH = _voter_web_path
	    and p.GS_PROGRAM_ID = pr.ID and pr.WEB_PATH = _program_web_path
	;
    IF(@voter_id is null) THEN 
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Voter not found for ';
	END IF;
    select p.id into @voter_target_id from gs_participant p, gs_player pl, gs_program pr
        where p.GS_PLAYER_ID = pl.id and pl.WEB_PATH = _voter_target_web_path
          and p.GS_PROGRAM_ID = pr.ID and pr.WEB_PATH = _program_web_path
	;
    IF(@voter_target_id is null) THEN 
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Voter target not found for ';
	END IF;
    
    select id into @vote_effectiveness_type_id from gs_vote_effectiveness_type where web_path = _vote_effectiveness_type_web_path;
	IF(@vote_effectiveness_type_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Vote effectiveness type not found for ';
	END IF;
    select id into @vote_type_id from gs_vote_type where web_path = _vote_type_web_path;
	IF(@vote_type_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Vote type not found for ';
	END IF;    
    insert into gs_vote
		(gs_voter_participant_id, gs_voter_target_participant_id, gs_team_id, vote_number, time_unit, sequence, gs_vote_effectiveness_type_id, gs_vote_type_id)
	values 
		(@voter_id, @voter_target_id, @team_id, _vote_number, _time_unit, _sequence, @vote_effectiveness_type_id, @vote_type_id)
        ;
	set @new_vote_id = LAST_INSERT_ID();
  
end$$
delimiter $$
drop procedure IF EXISTS first_vote$$
create procedure first_vote
(
    _program_web_path varchar(100),
	_voter_web_path varchar(100),
    _voter_target_web_path varchar(100),
    _team_web_path varchar(100),
    _time_unit int,
    _vote_effectiveness_type_web_path varchar(100),
    _vote_type_web_path varchar(100)
)
begin
	call vote (_program_web_path, _voter_web_path, _voter_target_web_path, _team_web_path, 1, _time_unit, 1, _vote_effectiveness_type_web_path, _vote_type_web_path);
end$$
delimiter $$
drop procedure IF EXISTS first_vote_against$$
create procedure first_vote_against
(
    _program_web_path varchar(100),
	_voter_web_path varchar(100),
    _voter_target_web_path varchar(100),
    _team_web_path varchar(100),
    _time_unit int,
    _vote_effectiveness_type_web_path varchar(100)
)
begin
	call first_vote (_program_web_path, _voter_web_path, _voter_target_web_path, _team_web_path, _time_unit, _vote_effectiveness_type_web_path, 'vote-contre');
end$$
delimiter $$
drop procedure IF EXISTS first_vote_for$$
create procedure first_vote_for
(
    _program_web_path varchar(100),
	_voter_web_path varchar(100),
    _voter_target_web_path varchar(100),
    _team_web_path varchar(100),
    _time_unit int,
    _vote_effectiveness_type_web_path varchar(100)
)
begin
	call first_vote (_program_web_path, _voter_web_path, _voter_target_web_path, _team_web_path, _time_unit, _vote_effectiveness_type_web_path, 'vote-pour');
end$$
delimiter $$
drop procedure IF EXISTS second_vote_against$$
create procedure second_vote_against
(
    _program_web_path varchar(100),
	_voter_web_path varchar(100),
    _voter_target_web_path varchar(100),
    _team_web_path varchar(100),
    _time_unit int,
    _vote_effectiveness_type_web_path varchar(100)
)
begin
-- _vote_number 2 sequence 1
	call vote (_program_web_path, _voter_web_path, _voter_target_web_path, _team_web_path, 2, _time_unit, 1, _vote_effectiveness_type_web_path, 'vote-contre');
end$$
delimiter $$
drop procedure IF EXISTS second_round_first_vote_for$$
create procedure second_round_first_vote_for
(
    _program_web_path varchar(100),
    _voter_web_path varchar(100),
    _voter_target_web_path varchar(100),
    _team_web_path varchar(100),
    _time_unit int,
    _vote_effectiveness_type_web_path varchar(100)
)
begin
  --    call first_vote (_program_web_path, _voter_web_path, _voter_target_web_path, _team_web_path, _time_unit, _vote_effectiveness_type_web_path, 'vote-pour');
            call vote (_program_web_path, _voter_web_path, _voter_target_web_path, _team_web_path, 1, _time_unit, 2, _vote_effectiveness_type_web_path, 'vote-pour');

end$$
delimiter ;
