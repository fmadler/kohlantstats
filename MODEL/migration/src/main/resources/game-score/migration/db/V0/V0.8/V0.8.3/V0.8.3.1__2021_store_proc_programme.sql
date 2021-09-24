-- store procedure
delimiter $$
drop procedure IF EXISTS create_programme$$
-- TODO
create procedure create_programme
(

	_name varchar(100),
	_web_path varchar(100),
    _year int,
	_edition_number int,
    _number_of_days int,
	_place_web_path varchar(100),
	_place_name varchar(100),
	_is_active tinyint
)
begin
	set @location_id = null;
    
	select id into @location_id from gs_location where PLACE_WEB_PATH = _place_web_path;
    IF(@location_id is null) THEN 
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Location not found ';
	END IF;

	INSERT INTO `GS_PROGRAM` (`EDITION_NUMBER`, `YEAR`, `NAME`, `WEB_PATH`, `GS_TIME_UNIT_TYPE_ID`, `TOTAL_TIME_LENGTH`, `GS_LOCATION_ID`, `IS_ACTIVE`) 
		VALUES (_edition_number, _year, _name, _web_path, 1, _number_of_days, @location_id, _is_active);

    
end$$

delimiter ;
