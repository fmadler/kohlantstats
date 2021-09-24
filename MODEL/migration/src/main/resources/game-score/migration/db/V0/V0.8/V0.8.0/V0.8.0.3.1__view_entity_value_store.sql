create or replace view v_entity_type as
select distinct
context_type_web_path,
entity_type_web_path,
entity_type_web_path as entity_type_name
from
v_sitemap_param
;

create or replace view v_entity_description_type as
select 'player' as entity_type_web_path, 'main' as description_type_name, 'main' as description_type_web_path
union
select 'participant' as entity_type_web_path, 'main' as description_type_name, 'main' as description_type_web_path
union
select 'program' as entity_type_web_path, 'main' as description_type_name, 'main' as description_type_web_path
union
select 'game' as entity_type_web_path, 'main' as description_type_name, 'main' as description_type_web_path
union
select 'team' as entity_type_web_path, 'main' as description_type_name, 'main' as description_type_web_path
from
dual
;

create or replace view v_entity_binary_type as
select 'player' as entity_type_web_path, 'photo_up' as binary_type_name, 'photo_up' as binary_type_web_path
union
select 'player' as entity_type_web_path, 'face' as binary_type_name, 'face' as binary_type_web_path
union
select 'participant' as entity_type_web_path, 'photo_up' as binary_type_name, 'photo_up' as binary_type_web_path
union
select 'participant' as entity_type_web_path, 'face' as binary_type_name, 'face' as binary_type_web_path
union
select 'program' as entity_type_web_path, 'poster' as binary_type_name, 'poster' as binary_type_web_path
union
select 'game' as entity_type_web_path, 'photo' as binary_type_name, 'photo' as binary_type_web_path
union
select 'game' as entity_type_web_path, 'winner' as binary_type_name, 'winner' as binary_type_web_path
union
select 'team' as entity_type_web_path, 'poster' as binary_type_name, 'poster' as binary_type_web_path
from
dual
;
