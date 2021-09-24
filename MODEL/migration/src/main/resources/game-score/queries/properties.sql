-- generic properties finder

-- for player
select 
    sp.PROPERTY property,
    sp.ICON icon,
    sp.UNIT unit,
    s.VALUE property_value
from 
	gs_ev_store s, 
    gs_ev_store_property sp
where
	s.PROPERTY_ID = sp.ID and
    s.PROPERTY_ID = sp.ID and
	s.ENTITY_TYPE = 'player' and
    s.ENTITY_WEB_PATH = 'loic-2020'
-- for programme
-- for game