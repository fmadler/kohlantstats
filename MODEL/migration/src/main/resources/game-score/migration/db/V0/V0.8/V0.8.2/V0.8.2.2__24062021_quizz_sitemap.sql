create or replace view v_sitemap_quizz_param as
select 1 as score, -1 entity_id, 'quizz' business_entity_path, 'qui-a-gagne-le-jeu-de-la-saison' business_path, 
concat_ws('','?filter1WebPath=',q.program_web_path,'&filter2WebPath=',q.game_web_path) query_params,  now() last_modification, 'weekly' frequency, '0.5' priority
from quizz_participation_filter_matrix_v q
union
select 1 as score, -1 entity_id, 'quizz' business_entity_path, 'repartition-des-participants-par-epreuve' business_path, 
concat_ws('','?filter1WebPath=',q.program_web_path,'&filter2WebPath=',q.game_web_path) query_params,  now() last_modification, 'weekly' frequency, '0.5' priority
from quizz_sort_team_member_filter_matrix_v q
union
select 1 as score, -1 entity_id, 'quizz' business_entity_path, 'classement-des-meilleurs-participants' business_path, 
concat_ws('','?filter1WebPath=',q.program_web_path,'&filter2WebPath=',q.game_web_path) query_params,  now() last_modification, 'weekly' frequency, '0.5' priority
from quizz_winner_participant_order_filter_matrix_v q
union
select 1 as score, -1 entity_id, 'quizz' business_entity_path, 'classement-des-meilleures-tribus' business_path, 
concat_ws('','?filter1WebPath=',q.program_web_path,'&filter2WebPath=',q.game_web_path) query_params,  now() last_modification, 'weekly' frequency, '0.5' priority
from quizz_winner_team_order_filter_matrix_v q
union
select 1 as score, -1 entity_id, 'quizz' business_entity_path, 'quelle-tribu-a-gagne-le-jeu-de-la-saison' business_path, 
concat_ws('','?filter1WebPath=',q.program_web_path,'&filter2WebPath=',q.game_web_path) query_params,  now() last_modification, 'weekly' frequency, '0.5' priority
from quizz_winner_team_filter_matrix_v q
;
