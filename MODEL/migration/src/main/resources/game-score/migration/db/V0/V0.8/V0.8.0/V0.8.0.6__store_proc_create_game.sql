-- store procedure
delimiter $$
drop procedure IF EXISTS create_game$$
create procedure create_game
(
    _program_web_path varchar(100),
	_game_name varchar(100),
    _game_web_path varchar(100),
    _game_type_web_path varchar(100),
    _game_participation_type_web_path varchar(100),
	_game_stake_web_path varchar(100),
    _program_index int,
    _time_unit_index int,
    _reward_web_paths varchar(100),
    -- no need penalties are negative rewards_penalties_web_paths varchar(100)
    _tag_web_paths varchar(100)
)
begin
	DECLARE r INT Default 0 ;
    DECLARE p INT Default 0 ;
    DECLARE str     VARCHAR(255);
    set @program_id = null;
	set @game_id = null;
    set @game_type_id = null;
    set @game_stake_id = null;
    set @reward_web_paths = null;
    set @tag_web_paths = null;
    
    select id into @program_id from gs_program where WEB_PATH = _program_web_path;
    IF(@program_id is null) THEN 
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Program not found ';
	END IF;
	select id into @game_participation_type_id from gs_game_participation_type where  WEB_PATH = _game_participation_type_web_path;
    IF(@game_participation_type_id is null) THEN
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Participation type not found ';
	END IF;
    select gt.id into @game_type_id from gs_game_type gt where  gt.WEB_PATH = _game_type_web_path;
    IF(@game_type_id is null) THEN 
        -- create game type
        INSERT INTO `GS_GAME_TYPE` (`NAME`, `WEB_PATH`) VALUES (_game_type_web_path, _game_type_web_path);
        set @game_type_id = LAST_INSERT_ID();
	END IF;
	select gs.id into @game_stake_id from gs_game_stake_type gs where gs.WEB_PATH = _game_stake_web_path;
    IF(@game_stake_id is null) THEN 
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Game stake not found';
	END IF;
        
	INSERT INTO `GS_GAME` (`NAME`, `WEB_PATH`, `GS_GAME_PARTICIPATION_TYPE_ID`, `TIME_POSITION`, `TIME_UNIT_INDEX`, `PROGRAM_INDEX`, `GS_GAME_TYPE_ID`, `GS_GAME_STAKE_TYPE_ID`, `GS_PROGRAM_ID`)
    VALUES (_game_name, _game_web_path, @game_participation_type_id, _program_index, _time_unit_index, _program_index, @game_type_id, @game_stake_id, @program_id);

	set @game_id = LAST_INSERT_ID();
    
    -- insert rewards

	IF(_reward_web_paths IS NOT NULL) THEN
        simple_loop: LOOP
			set @gs_reward_id = null;
           SET r=r+1;
           SET str=SPLIT_STR(_reward_web_paths,",",r);
           IF str='' THEN
              LEAVE simple_loop;
           END IF;
           select id into @gs_reward_id from gs_reward where web_path = str;
           IF(@gs_reward_id is not null) THEN 
			   INSERT INTO GS_GAME_X_REWARD 
					(GS_GAME_ID, GS_REWARD_ID, DISPLAY_ORDER) 
				values 
					(@game_id, @gs_reward_id, r);
			END IF;
        END LOOP simple_loop;
      END IF;
    
	IF(_tag_web_paths IS NOT NULL) THEN
        simple_loop: LOOP
			set @gs_tag_id = null;
           SET r=r+1;
           SET str=SPLIT_STR(_tag_web_paths,",",r);
           IF str='' THEN
              LEAVE simple_loop;
           END IF;
           select id into @gs_tag_id from gs_game_tag where web_path = str;
           IF(@gs_tag_id is not null) THEN 
			   INSERT INTO GS_GAME_X_TAG
					(GS_GAME_ID, GS_GAME_TAG_ID, DISPLAY_ORDER) 
				values 
					(@game_id, @gs_tag_id, r);
			END IF;
        END LOOP simple_loop;
      END IF;
      
end$$
delimiter ;
