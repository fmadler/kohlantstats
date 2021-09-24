delimiter $$
drop procedure IF EXISTS add_participant$$
create procedure add_participant
(
	_program_web_path varchar(100),
    _first_name varchar(45),
    _last_name varchar(45),
    _player_web_path varchar(45),
    _sex varchar(2),
    _age_tournage int,
	_birth_date datetime,
    _final_position int,
    _residence varchar(30),
    _profession varchar(100)
)
begin
	set @program_id = null;
    set @participant_id = null;
    set @player_id = null;
    
    select id into @program_id from gs_program where WEB_PATH = _program_web_path;
    IF(@program_id is null) THEN 
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Program not found ';
	END IF;
    select id into @player_id from gs_player where web_path = _player_web_path;
	IF(@player_id is null) THEN 
		-- insert player
        insert into gs_player (name, web_path, sex) values (_first_name, _player_web_path, _sex);
        set @player_id = LAST_INSERT_ID();
	END IF;
    update gs_player set sex=_sex, name=_first_name, family_name = _last_name, birth_date = _birth_date
    where id = @player_id
    ;
    select pa.id into @participant_id from gs_participant pa, gs_player pl, gs_program pr 
    where 
        pa.gs_program_id = pr.id and 
		pa.gs_player_id = pl.id and
		pr.web_path = _program_web_path and pl.WEB_PATH = _player_web_path;
	IF(@participant_id is null) THEN 
		-- insert participant
        insert into gs_participant (gs_program_id, gs_player_id) values (@program_id, @player_id);
        set @participant_id = LAST_INSERT_ID();
	END IF;
    update gs_participant set age=_age_tournage, final_position = _final_position
    where id = @participant_id
    ;	
    -- TODO residence + profession
    
end$$
delimiter ;
