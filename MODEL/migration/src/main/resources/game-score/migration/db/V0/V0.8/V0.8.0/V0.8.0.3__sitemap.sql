create or replace view v_sitemap_param as
select 1 as score, -1 entity_id, 'programme' entity_type_web_path, name, web_path entity_web_path, null context_type_web_path, null context_web_path,  now() last_modification, 'weekly' frequency, '0.5' priority
from gs_program p
union
select 1 as score, t.id entity_id, 'team' entity_type_web_path, t.name, t.web_path entity_web_path, 'programme' context_type_web_path, p.WEB_PATH context_web_path,  now() last_modification, 'weekly' frequency, '0.5' priority
from gs_program p, gs_team t where t.GS_PROGRAM_ID = p.ID
union
select 1 as score, entity_id, 'game' entity_type_web_path, name, entity_web_path, 'programme' context_type_web_path, context_web_path,  now() last_modification, 'weekly' frequency, '0.5' priority
from (
select distinct g.id entity_id, p.web_path context_web_path, g.NAME name, g.WEB_PATH entity_web_path
from gs_program p, gs_team t, gs_game g, GS_PARTICIPANT_X_GAME pxg
where t.GS_PROGRAM_ID = p.ID and pxg.GS_TEAM_ID = t.ID and pxg.GS_GAME_ID = g.ID
) x
union
select 1 as score, entity_id, 'participant' entity_type_web_path, name, entity_web_path, 'programme' context_type_web_path, context_web_path,  now() last_modification, 'weekly' frequency, '0.5' priority
from (
select p.id entity_id, p.web_path context_web_path, pl.NAME name, pl.WEB_PATH entity_web_path
from gs_program p, gs_participant pa, gs_player pl
where pa.GS_PROGRAM_ID = p.ID and pa.GS_PLAYER_ID = pl.ID
) x
union
select 1 as score, p.id entity_id, 'player' entity_type_web_path, name, web_path entity_web_path, null context_type_web_path, null context_web_path,  now() last_modification, 'weekly' frequency, '0.5' priority
from gs_player p
;

create or replace view v_sitemap_param_core as
select 
sp.*, 
concat_ws('/',
CAST(context_type_web_path AS CHAR CHARACTER SET utf8mb4),
CAST(context_web_path AS CHAR CHARACTER SET utf8mb4),
CAST(entity_type_web_path AS CHAR CHARACTER SET utf8mb4),
CAST(entity_web_path AS CHAR CHARACTER SET utf8mb4)
) entity_full_web_path 
from v_sitemap_param sp
;


create or replace view v_sitemap_core as
select 
spc.*, 
c.param_value from v_sitemap_param_core spc, conf_param c
where param_key = 'SERVER_ROOT_URL'
;

create or replace view v_sitemap as
select concat_ws('/',
CAST(param_value AS CHAR CHARACTER SET utf8mb4),
CAST(entity_full_web_path AS CHAR CHARACTER SET utf8mb4)
) location ,
last_modification,
frequency,
priority,
score
from v_sitemap_core
;

-- select * from v_sitemap ;