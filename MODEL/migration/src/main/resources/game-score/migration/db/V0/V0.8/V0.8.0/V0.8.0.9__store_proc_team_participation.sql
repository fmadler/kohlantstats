-- store procedure
delimiter $$
drop procedure IF EXISTS create_participant_entrance$$
-- TODO
create procedure create_participant_entrance
(
	_program_web_path varchar(100),
	_participant_web_path varchar(100),
    _team_web_path varchar(100),
	_from_time int,
    _entrance_type_web_path varchar(100),
    out new_participant_team_id int
)
begin
	set @participant_id = null;
    set @team_id = null;
    set @entrance_type_id = null;
    set @realisation_web_paths = null;
    
    select p.id into @participant_id from gs_participant p, gs_player pl, gs_program pr 
		where p.GS_PLAYER_ID = pl.id and pl.WEB_PATH =_participant_web_path
		and p.GS_PROGRAM_ID = pr.ID and pr.WEB_PATH=_program_web_path;
    IF(@participant_id is null) THEN 
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Participant not found for ';
	END IF;
    select id into @team_id from gs_team where web_path = _team_web_path;
	IF(@team_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Team not found for ';
	END IF;
    select id into @entrance_type_id from gs_team_entrance_type where web_path = _entrance_type_web_path;
	IF(@entrance_type_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Entrance type not found for ';
	END IF;
    insert into gs_participant_team
		(gs_participant_id, gs_team_id, from_time_unit, gs_team_entrance_type_id)
	values 
		(@participant_id, @team_id, _from_time, @entrance_type_id)
        ;
	set new_participant_team_id = LAST_INSERT_ID();
    
end$$

-- create_participant_departure
drop procedure IF EXISTS create_participant_departure
$$
create procedure create_participant_departure
(
	_program_web_path varchar(100),
	_participant_web_path varchar(100),
    _team_web_path varchar(100),
    _to_time int,
    _departure_type_web_path varchar(100),
    out participant_team_id int
)
begin
	DECLARE r INT Default 0 ;
    DECLARE p INT Default 0 ;
    DECLARE str     VARCHAR(255);
	set @participant_id = null;
    set @team_id = null;
    set @departure_type_id = null;
    set @realisation_web_paths = null;
    set @gs_participant_team_id = null;
    
    select p.id into @participant_id from gs_participant p, gs_player pl, gs_program pr 
		where p.GS_PLAYER_ID = pl.id and pl.WEB_PATH =_participant_web_path
		and p.GS_PROGRAM_ID = pr.ID and pr.WEB_PATH=_program_web_path;
	IF(@participant_id is null) THEN 
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Participant not found for ';
	END IF;
    select id into @team_id from gs_team where web_path = _team_web_path;
	IF(@team_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Team not found for ';
	END IF;
    
    select id into @gs_participant_team_id from gs_participant_team where gs_participant_id = @participant_id and gs_team_id = @team_id;
	IF(@gs_participant_team_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'team participation not found for ';
	END IF;    
    
    select id into @departure_type_id from gs_team_departure_type where web_path = _departure_type_web_path;
	IF(@departure_type_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Departure type not found for ';
	END IF;
    
    update gs_participant_team set to_time_unit = _to_time, gs_team_departure_type_id = @departure_type_id
		where id = @gs_participant_team_id;
    
    select @gs_participant_team_id into participant_team_id;
end$$

drop procedure IF EXISTS create_team_participation
$$
create procedure create_team_participation
(
	_program_web_path varchar(100),
	_participant_web_path varchar(100),
    _team_web_path varchar(100),
	_from_time int,
    _to_time int,
    _entrance_type_web_path varchar(100),
    _departure_type_web_path varchar(100)
)
begin
	call create_participant_entrance
(
	_program_web_path,
	_participant_web_path,
    _team_web_path,
	_from_time,
    _entrance_type_web_path,
    _realisation_web_paths,
    @participant_team_id
);
	call create_participant_departure
(
	_program_web_path,
	_participant_web_path,
    _team_web_path,
    _to_time,
    _departure_type_web_path,
    _realisation_web_paths,
    @participant_team_id
);
end$$

-- create_participant_realisation
drop procedure IF EXISTS create_participant_realisation
$$
create procedure create_participant_realisation
(
	_program_web_path varchar(100),
    _participant_web_path varchar(100),
    _team_web_path varchar(100),
    _time_unit int,
    _realisation_web_path varchar(100),
    out _out_GS_PARTICIPANT_TEAM_X_REALISATION_id int
)
begin

	set @participant_id = null;
    set @team_id = null;
    set @realisation_id = null;
    set @gs_participant_team_id = null;
    
    select p.id into @participant_id from gs_participant p, gs_player pl, gs_program pr 
		where p.GS_PLAYER_ID = pl.id and pl.WEB_PATH =_participant_web_path
		and p.GS_PROGRAM_ID = pr.ID and pr.WEB_PATH=_program_web_path;
    IF(@participant_id is null) THEN 
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Participant not found for ';
	END IF;
    select id into @team_id from gs_team where web_path = _team_web_path;
	IF(@team_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Team not found for ';
	END IF;
    
    select id into @gs_participant_team_id from gs_participant_team where gs_participant_id = @participant_id and gs_team_id = @team_id;
	IF(@gs_participant_team_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'team participation not found for ';
	END IF;    
    
    select id into @realisation_id from gs_realisation_type where web_path = _realisation_web_path;
	IF(@realisation_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Realisation type not found for ';
	END IF;
    
    -- insert realisation
    insert into GS_PARTICIPANT_TEAM_X_REALISATION
		(gs_participant_team_id, gs_realisation_type_id, time_unit, display_order)
	values 
		(@gs_participant_team_id, @realisation_id, _time_unit, 1)
        ;
	set _out_GS_PARTICIPANT_TEAM_X_REALISATION_id = LAST_INSERT_ID();
end$$
delimiter ;
