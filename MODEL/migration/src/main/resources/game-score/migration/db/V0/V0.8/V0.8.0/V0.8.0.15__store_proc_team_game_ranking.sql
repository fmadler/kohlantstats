delimiter $$
drop procedure IF EXISTS team_game_ranking$$
create procedure team_game_ranking
(
	_team_web_path varchar(100),
	_game_web_path varchar(100),
    _ranking int
)
begin
	set @pteam_id = null;
    set @game_id = null;

    select id into @team_id from gs_team where WEB_PATH = _team_web_path;
    IF(@team_id is null) THEN
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Team not found ';
	END IF;
	select id into @game_id from gs_game where WEB_PATH = _game_web_path;
    IF(@game_id is null) THEN
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Game not found ';
	END IF;

    insert into gs_team_x_game (gs_team_id, gs_game_id, ranking) values (@team_id, @game_id, _ranking);

end$$
delimiter ;
