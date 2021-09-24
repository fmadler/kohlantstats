-- KL game prop

select 
	g.name game_name, 
    g.web_path game_web_path,
    sp.PROPERTY property,
    sp.ICON icon,
    sp.UNIT unit,
    s.VALUE property_value

 from gs_program pr, gs_game g, gs_game_type gt, gs_ev_store s, gs_ev_store_property sp
where
g.GS_PROGRAM_ID = pr.ID and g.ID = s.ENTITY_ID and s.ENTITY_TYPE = 'game' and s.PROPERTY_ID = sp.ID