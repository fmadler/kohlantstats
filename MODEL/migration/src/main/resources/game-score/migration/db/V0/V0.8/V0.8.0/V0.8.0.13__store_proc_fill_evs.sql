-- store procedure
delimiter $$

drop procedure IF EXISTS fill_property$$
create procedure fill_property
(
	_entity_type varchar(100),
    _entity_web_path varchar(100),
    _property varchar(100),
    _value varchar(100)
)
begin
	set @property_id = null;
    
    select ev.id into @property_id from GS_EV_STORE_PROPERTY ev where  ev.PROPERTY = _property;
    IF(@property_id is null) THEN 
		SIGNAL SQLSTATE '50000'
			SET MESSAGE_TEXT = 'Property not found';
	END IF;   
    insert into GS_EV_STORE
		(ENTITY_TYPE, ENTITY_WEB_PATH, ENTITY_ID, PROPERTY_ID, `VALUE`)
	values 
		(_entity_type, _entity_web_path, -1, @property_id, _value)
        ;
     
end$$
delimiter ;
