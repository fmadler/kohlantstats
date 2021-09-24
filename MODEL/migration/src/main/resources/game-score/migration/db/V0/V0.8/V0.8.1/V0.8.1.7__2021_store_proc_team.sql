-- store procedure
delimiter $$
drop procedure IF EXISTS create_team$$
-- TODO
create procedure create_team
(
	_program_web_path varchar(100),
	_name varchar(100),
    _web_path varchar(100),
	_alias varchar(100),
	_from_time int,
	_from_to int
)
begin
	set @program_id = null;
	set @team_duration_id = null;
    
	select id into @program_id from gs_program where WEB_PATH = _program_web_path;
    IF(@program_id is null) THEN 
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Program not found ';
	END IF;

	INSERT INTO `GS_TEAM_DURATION` (`FROM_TIME_UNIT`, `TO_TIME_UNIT`) VALUES (_from_time, _from_to);
	set @team_duration_id = LAST_INSERT_ID();
	INSERT INTO `GS_TEAM` (`GS_PROGRAM_ID`, `NAME`, `WEB_PATH`, `GS_TEAM_DURATION_ID`, `ALIAS`) VALUES (@program_id, _name, _web_path, @team_duration_id, _alias);

	-- set new_team_id = LAST_INSERT_ID();
    
end$$

delimiter ;
