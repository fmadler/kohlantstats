-- 9ème jour
-- 

call create_game('la-legende-2021','Pallets','pallet-2021','pallet','individuel','arene',9,8,'exclusion-immediate,continuation-aventure','dexterite,rapidite,equilibre');
call create_program_game_participation('la-legende-2021','ugo-2012','ile-des-bannis-2021','pallet-2021','participant','individuel',2,'continuation-aventure');
call create_program_game_participation('la-legende-2021','karima-2016','ile-des-bannis-2021','pallet-2021','participant','individuel',3,'exclusion-immediate');
call create_program_game_participation('la-legende-2021','maxime-2019','ile-des-bannis-2021','pallet-2021','participant','individuel',1,'continuation-aventure');

call create_participant_departure('la-legende-2021','karima-2016','ile-des-bannis-2021',9,'elimination-du-dernier', @participant_team_id);

call create_game('la-legende-2021','Paresseux','paresseux-2021-2','paresseux','individuel','confort',9,9,'nourriture-riz','patience,statique');

call create_game_participation('claude-2010','jaune-2021-2','paresseux-2021-2','participant','individuel',1,'nourriture-riz'); 
-- 13
call create_game_participation('coumba-2010','jaune-2021-2','paresseux-2021-2','participant','individuel',13,'nourriture-riz'); 
-- 1
call create_game_participation('sam-2018','jaune-2021-2','paresseux-2021-2','participant','individuel',3,'nourriture-riz');
-- 11
call create_game_participation('phil-2012','jaune-2021-2','paresseux-2021-2','participant','individuel',0,'nourriture-riz'); 
-- 2
call create_game_participation('christelle-2008','jaune-2021-2','paresseux-2021-2','participant','individuel',0,'nourriture-riz');
-- 4
call create_game_participation('clemence-2005','jaune-2021-2','paresseux-2021-2','participant','individuel',0,'nourriture-riz');
-- 6
call create_game_participation('candice-2016','jaune-2021-2','paresseux-2021-2','participant','individuel',0,'nourriture-riz');

call create_program_game_participation('la-legende-2021','loic-2020','rouge-2021-2','paresseux-2021-2','exclusion-apres-tirage-au-sort','individuel',0,'');
call create_game_participation('teheiura-2011','rouge-2021-2','paresseux-2021-2','participant','individuel',2,'');
-- 12
call create_game_participation('laurent-2011','rouge-2021-2','paresseux-2021-2','participant','individuel',4,'');
-- 10
call create_game_participation('namadia-2012','rouge-2021-2','paresseux-2021-2','participant','individuel',0,'');
-- 3
call create_game_participation('clementine-2017','rouge-2021-2','paresseux-2021-2','participant','individuel',0,'');
-- 7
call create_game_participation('jade-2007','rouge-2021-2','paresseux-2021-2','participant','individuel',6,'');
-- 8
call create_program_game_participation('la-legende-2021','alexandra-2020','rouge-2021-2','paresseux-2021-2','participant','individuel',5,'');
-- 9
call create_program_game_participation('la-legende-2021','alix-2020','rouge-2021-2','paresseux-2021-2','participant','individuel',0,'');
-- 5

call team_game_ranking ('rouge-2021-2','paresseux-2021-2',2);
call team_game_ranking ('jaune-2021-2','paresseux-2021-2',1);



call create_game('la-legende-2021','Relais aquatique','relais-aquatique-2021','relais-aquatique','equipe','immunite',10,10,'totem','apnee,rapidite,natation,force');


call create_game_participation('claude-2010','jaune-2021-2','relais-aquatique-2021','participant','collectif',1,'totem');
call create_game_participation('coumba-2010','jaune-2021-2','relais-aquatique-2021','participant','collectif',1,'totem');
call create_game_participation('sam-2018','jaune-2021-2','relais-aquatique-2021','participant','collectif',1,'totem');
call create_game_participation('phil-2012','jaune-2021-2','relais-aquatique-2021','participant','collectif',1,'totem');
call create_game_participation('christelle-2008','jaune-2021-2','relais-aquatique-2021','participant','collectif',1,'totem');
call create_game_participation('clemence-2005','jaune-2021-2','relais-aquatique-2021','participant','collectif',1,'totem');
call create_game_participation('candice-2016','jaune-2021-2','relais-aquatique-2021','participant','collectif',1,'totem');

call create_program_game_participation('la-legende-2021','loic-2020','rouge-2021-2','relais-aquatique-2021','participant','collectif',2,'');
call create_game_participation('teheiura-2011','rouge-2021-2','relais-aquatique-2021','participant','collectif',2,'');
call create_game_participation('laurent-2011','rouge-2021-2','relais-aquatique-2021','participant','collectif',2,'');
call create_game_participation('namadia-2012','rouge-2021-2','relais-aquatique-2021','exclusion-apres-tirage-au-sort','collectif',2,'');
call create_game_participation('clementine-2017','rouge-2021-2','relais-aquatique-2021','participant','collectif',2,'');
call create_game_participation('jade-2007','rouge-2021-2','relais-aquatique-2021','participant','collectif',2,'');
call create_program_game_participation('la-legende-2021','alexandra-2020','rouge-2021-2','relais-aquatique-2021','participant','collectif',2,'');
call create_program_game_participation('la-legende-2021','alix-2020','rouge-2021-2','relais-aquatique-2021','participant','collectif',2,'');

call team_game_ranking ('rouge-2021-2','relais-aquatique-2021',1);
call team_game_ranking ('jaune-2021-2','relais-aquatique-2021',2);

call first_vote_against ('la-legende-2021','alexandra-2020','clementine-2017','rouge-2021-2', 11, 'effectif');
call first_vote_against ('la-legende-2021','jade-2007','laurent-2011','rouge-2021-2', 11, 'effectif');
call first_vote_against ('la-legende-2021','alix-2020','jade-2007','rouge-2021-2', 11, 'effectif');
call first_vote_against ('la-legende-2021','clementine-2017','laurent-2011','rouge-2021-2', 11, 'effectif');

call first_vote_against ('la-legende-2021','teheiura-2011','clementine-2017','rouge-2021-2', 11, 'effectif');
call first_vote_against ('la-legende-2021','laurent-2011','jade-2007','rouge-2021-2', 11, 'effectif');
call first_vote_against ('la-legende-2021','namadia-2012','clementine-2017','rouge-2021-2', 11, 'effectif');
call first_vote_against ('la-legende-2021','loic-2020','clementine-2017','rouge-2021-2', 11, 'effectif');

call create_participant_departure('la-legende-2021','clementine-2017','rouge-2021-2',11,'exclusion-par-vote', @participant_team_id);
call create_participant_entrance ('la-legende-2021','clementine-2017','ile-des-bannis-2021',12,'constitution-des-equipes', @participant_team_id);





