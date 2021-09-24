-- store procedure
delimiter $$
DROP function IF EXISTS `SPLIT_STR`$$

CREATE FUNCTION SPLIT_STR(
  x VARCHAR(255),
  delim VARCHAR(12),
  pos INT
)
RETURNS VARCHAR(255)
RETURN TRIM(REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, ''))
$$

drop procedure IF EXISTS create_game_participation$$
create procedure create_game_participation
(
	_participant_web_path varchar(100),
    _team_web_path varchar(100),
	_game_web_path varchar(100),
    _activity_type_web_path varchar(100),
    _participation_type_web_path varchar(100),
    _ranking int,
    _reward_web_paths varchar(100)
    -- no need penalties are negative rewards_penalties_web_paths varchar(100)
)
begin
	DECLARE r INT Default 0 ;
    DECLARE p INT Default 0 ;
    DECLARE str     VARCHAR(255);
	set @participant_id = null;
    set @team_id = null;
    set @game_id = null;
    set @activity_type_id = null;
    set @participation_type_id = null;
    set @reward_web_paths = null;
    set @penalties_web_paths = null;
    
    select p.id into @participant_id from gs_participant p, gs_player pl where p.GS_PLAYER_ID = pl.id and pl.WEB_PATH = _participant_web_path;
    IF(@participant_id is null) THEN 
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Participant not found for ';
	END IF;
    select id into @team_id from gs_team where web_path = _team_web_path;
	IF(@team_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Team not found for ';
	END IF;
    select id into @game_id from gs_game where web_path = _game_web_path;
	IF(@game_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Game not found for ';
	END IF;
    select id into @activity_type_id from gs_game_activity_type where web_path = _activity_type_web_path;
	IF(@activity_type_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Activity type not found for ';
	END IF;
    select id into @participation_type_id from gs_game_participation_type where web_path = _participation_type_web_path;
	IF(@activity_type_id is null) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Participation type not found for ';
	END IF;    
    insert into gs_participant_x_game
		(gs_participant_id, gs_team_id, gs_game_id, gs_game_activity_type_id, gs_game_participation_type_id, ranking)
	values 
		(@participant_id, @team_id, @game_id, @activity_type_id, @participation_type_id, _ranking)
        ;
	set @new_participant_x_game_id = LAST_INSERT_ID();
    
    -- TODO insert rewards
    
    /**/
	IF(_reward_web_paths IS NOT NULL) THEN
        simple_loop: LOOP
			set @gs_reward_id = null;
           SET r=r+1;
           SET str=SPLIT_STR(_reward_web_paths,",",r);
           IF str='' THEN
              LEAVE simple_loop;
           END IF;
           -- TODO reward should be linked to game
           select id into @gs_reward_id from gs_reward where web_path = str;
           INSERT INTO GS_PARTICIPANT_GAME_X_REWARD 
				(GS_PARTICIPANT_X_GAME_ID, GS_REWARD_ID, DISPLAY_ORDER) 
			values 
				(@new_participant_x_game_id, @gs_reward_id, r);
        END LOOP simple_loop;
      END IF;
     
     /* no need penalties are negative rewards
    -- TODO insert penalties
	IF(_reward_web_paths IS NOT NULL) THEN
        simple_loop: LOOP
			set @gs_reward_id = null;
           SET r=r+1;
           SET str=SPLIT_STR(_reward_web_paths,",",r);
           IF str='' THEN
              LEAVE simple_loop;
           END IF;
           select id into @gs_reward_id from gs_reward where web_path = str;
           INSERT INTO GS_PARTICIPANT_GAME_X_REWARD 
				(GS_PARTICIPANT_X_GAME_ID, GS_REWARD_ID, DISPLAY_ORDER) 
			values 
				(@new_participant_x_game_id, @gs_reward_id, r);
        END LOOP simple_loop;
      END IF;    
      */
end$$
delimiter ;

call create_game_participation
(
	'bertrand-kamal-2020',
    'est-2020',
	'parcours-relais-avec-obstacles-2020',
    'participant',
    'collectif',
    1,
    'totem'
)
;
select * from gs_participant_x_game
;
select * from GS_PARTICIPANT_GAME_X_REWARD
;
/*
select SPLIT_STR('totem',',',1)
;
select id from gs_reward where web_path = 'totem';
*/