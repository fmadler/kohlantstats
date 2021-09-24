INSERT INTO `GS_GAME_TYPE` (`NAME`, `WEB_PATH`, `DESCRIPTION`) VALUES ('Balancier', 'balancier', NULL);
INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Continuation de l''aventure', 'continuation-aventure', 3, 1);

-- 
INSERT INTO `GS_GAME_STAKE_TYPE` (`NAME`, `WEB_PATH`, `DESCRIPTION`) VALUES ('Arène', 'arene', NULL);

call create_game('la-legende-2021','Balancier','balancier-2021','balancier','individuel','arene',7,4,'exclusion-immediate,continuation-aventure','dexterite,statique,rapidite,equilibre');
call create_program_game_participation('la-legende-2021','ugo-2012','ile-des-bannis-2021','balancier-2021','participant','individuel',1,'continuation-aventure');
call create_program_game_participation('la-legende-2021','karima-2016','ile-des-bannis-2021','balancier-2021','participant','individuel',2,'continuation-aventure');
call create_program_game_participation('la-legende-2021','patrick-2009','ile-des-bannis-2021','balancier-2021','participant','individuel',3,'exclusion-immediate');
call create_program_game_participation('la-legende-2021','cindy-2019','ile-des-bannis-2021','balancier-2021','participant','individuel',3,'exclusion-immediate');

call create_participant_departure('la-legende-2021','patrick-2009','ile-des-bannis-2021',7,'elimination-du-dernier', @participant_team_id);
call create_participant_departure('la-legende-2021','cindy-2019','ile-des-bannis-2021',7,'elimination-du-dernier', @participant_team_id);


--
-- toto dissolution des équipes
--
-- todo vérifier les noms
call create_team('la-legende-2021','Lanta naï','jaune-2021-2','Jaune',7,15);
call create_team('la-legende-2021','Korok','rouge-2021-2','Rouge',7,15);

call create_participant_entrance ('la-legende-2021','coumba-2010','jaune-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','clemence-2005','jaune-2021-2',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','alix-2020','rouge-2021-2',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','alexandra-2020','rouge-2021-2',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','christelle-2008','jaune-2021-2',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','candice-2016','jaune-2021-2',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','clementine-2017','rouge-2021-2',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','jade-2007','rouge-2021-2',1,'constitution-des-equipes', @participant_team_id);


call create_participant_entrance ('la-legende-2021','loic-2020','rouge-2021-2',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','claude-2010','jaune-2021-2',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','teheiura-2011','rouge-2021-2',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','sam-2018','jaune-2021-2',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','laurent-2011','rouge-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','phil-2012','jaune-2021-2',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','maxime-2019','jaune-2021-2',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','namadia-2012','rouge-2021-2',1,'constitution-des-equipes', @participant_team_id);

-- TODO jaune 1 et 2

--
-- les flambeaux 
-- composition equipe en relais

call create_game('la-legende-2021','Les Flambeaux','flambeaux-2021-2','flambeaux','collectif','confort',7,6,'kit-peche','rapidite,cohesion,force');


call create_game_participation('claude-2010','jaune-2021-2','flambeaux-2021-2','participant','collectif',1,'kit-peche');
call create_game_participation('coumba-2010','jaune-2021-2','flambeaux-2021-2','participant','collectif',1,'kit-peche');
call create_game_participation('maxime-2019','jaune-2021-2','flambeaux-2021-2','participant','collectif',1,'kit-peche');
call create_game_participation('sam-2018','jaune-2021-2','flambeaux-2021-2','participant','collectif',1,'kit-peche');
call create_game_participation('phil-2012','jaune-2021-2','flambeaux-2021-2','participant','collectif',1,'kit-peche');
call create_game_participation('christelle-2008','jaune-2021-2','flambeaux-2021-2','participant','collectif',1,'kit-peche');
call create_game_participation('clemence-2005','jaune-2021-2','flambeaux-2021-2','participant','collectif',1,'kit-peche');
call create_game_participation('candice-2016','jaune-2021-2','flambeaux-2021-2','participant','collectif',1,'kit-peche');

call create_program_game_participation('la-legende-2021','loic-2020','rouge-2021-2','flambeaux-2021-2','participant','collectif',2,'');
call create_game_participation('teheiura-2011','rouge-2021-2','flambeaux-2021-2','participant','collectif',2,'');
call create_game_participation('laurent-2011','rouge-2021-2','flambeaux-2021-2','participant','collectif',2,'');
call create_game_participation('namadia-2012','rouge-2021-2','flambeaux-2021-2','participant','collectif',2,'');
call create_game_participation('clementine-2017','rouge-2021-2','flambeaux-2021-2','participant','collectif',2,'');
call create_game_participation('jade-2007','rouge-2021-2','flambeaux-2021-2','participant','collectif',2,'');
call create_program_game_participation('la-legende-2021','alexandra-2020','rouge-2021-2','flambeaux-2021-2','participant','collectif',2,'');
call create_program_game_participation('la-legende-2021','alix-2020','rouge-2021-2','flambeaux-2021-2','participant','collectif',2,'');

call team_game_ranking ('rouge-2021-2','flambeaux-2021-2',2);
call team_game_ranking ('jaune-2021-2','flambeaux-2021-2',1);
-- immunité offerte par loïc à alexandra
-- immunité offerte par clémence à maxime



call create_game('la-legende-2021','Le grand bleu','le-grand-bleu-2021','le-grand-bleu','equipe','immunite',8,7,'totem','apnee,rapidite,natation');


call create_game_participation('claude-2010','jaune-2021-2','le-grand-bleu-2021','participant','collectif',2,'');
call create_game_participation('coumba-2010','jaune-2021-2','le-grand-bleu-2021','participant','collectif',2,'');
call create_game_participation('maxime-2019','jaune-2021-2','le-grand-bleu-2021','participant','collectif',2,'');
call create_game_participation('sam-2018','jaune-2021-2','le-grand-bleu-2021','participant','collectif',2,'');
call create_game_participation('phil-2012','jaune-2021-2','le-grand-bleu-2021','participant','collectif',2,'');
call create_game_participation('christelle-2008','jaune-2021-2','le-grand-bleu-2021','participant','collectif',2,'');
call create_game_participation('clemence-2005','jaune-2021-2','le-grand-bleu-2021','participant','collectif',2,'');
call create_game_participation('candice-2016','jaune-2021-2','le-grand-bleu-2021','participant','collectif',2,'');

call create_program_game_participation('la-legende-2021','loic-2020','rouge-2021-2','le-grand-bleu-2021','participant','collectif',1,'totem');
call create_game_participation('teheiura-2011','rouge-2021-2','le-grand-bleu-2021','participant','collectif',1,'totem');
call create_game_participation('laurent-2011','rouge-2021-2','le-grand-bleu-2021','participant','collectif',1,'totem');
call create_game_participation('namadia-2012','rouge-2021-2','le-grand-bleu-2021','participant','collectif',1,'totem');
call create_game_participation('clementine-2017','rouge-2021-2','le-grand-bleu-2021','participant','collectif',1,'totem');
call create_game_participation('jade-2007','rouge-2021-2','le-grand-bleu-2021','participant','collectif',1,'totem');
call create_program_game_participation('la-legende-2021','alexandra-2020','rouge-2021-2','le-grand-bleu-2021','participant','collectif',1,'totem');
call create_program_game_participation('la-legende-2021','alix-2020','rouge-2021-2','le-grand-bleu-2021','participant','collectif',1,'totem');

call create_participant_realisation ('la-legende-2021','clemence-2005','jaune-2021-2',9,'decouverte-collier-immunite',@realisation_id);

call team_game_ranking ('rouge-2021-2','le-grand-bleu-2021',1);
call team_game_ranking ('jaune-2021-2','le-grand-bleu-2021',2);

-- todo decouverte de collier par clémence

/*
call first_vote_against ('la-legende-2021','alexandra-2020','cindy-2019','rouge-2021-2', 6, 'effectif');
call first_vote_against ('la-legende-2021','jade-2007','cindy-2019','rouge-2021-2', 6, 'effectif');
call first_vote_against ('la-legende-2021','alix-2020','cindy-2019','rouge-2021-2', 6, 'effectif');
call first_vote_against ('la-legende-2021','clementine-2017','alexandra-2020','rouge-2021-2', 6, 'effectif');

call first_vote_against ('la-legende-2021','teheiura-2011','patrick-2009','rouge-2021-2', 6, 'effectif');
call first_vote_against ('la-legende-2021','laurent-2011','maxime-2019','rouge-2021-2', 6, 'effectif');
call first_vote_against ('la-legende-2021','namadia-2012','patrick-2009','rouge-2021-2', 6, 'effectif');
call first_vote_against ('la-legende-2021','loic-2020','patrick-2009','rouge-2021-2', 6, 'effectif');
*/
call first_vote_against ('la-legende-2021','christelle-2008','maxime-2019','jaune-2021-2', 9, 'effectif');
call first_vote_against ('la-legende-2021','coumba-2010','maxime-2019','jaune-2021-2', 9, 'effectif');
call first_vote_against ('la-legende-2021','clemence-2005','phil-2012','jaune-2021-2', 9, 'effectif');
call first_vote_against ('la-legende-2021','candice-2016','maxime-2019','jaune-2021-2', 9, 'effectif');
call first_vote_against ('la-legende-2021','claude-2010','maxime-2019','jaune-2021-2', 9, 'effectif');
call first_vote_against ('la-legende-2021','phil-2012','maxime-2019','jaune-2021-2', 9, 'effectif');
call first_vote_against ('la-legende-2021','sam-2018','maxime-2019','jaune-2021-2', 9, 'effectif');
call first_vote_against ('la-legende-2021','maxime-2019','christelle-2008','jaune-2021-2', 9, 'effectif');

call create_participant_departure('la-legende-2021','maxime-2019','jaune-2021-2',9,'exclusion-par-vote', @participant_team_id);

call create_participant_entrance ('la-legende-2021','maxime-2019','ile-des-bannis-2021',10,'constitution-des-equipes', @participant_team_id);





