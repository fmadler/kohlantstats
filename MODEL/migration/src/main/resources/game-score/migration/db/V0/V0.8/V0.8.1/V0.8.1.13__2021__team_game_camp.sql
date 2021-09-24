INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Bora-bora', 'bora-bora', 5, 1);
INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Nuit luxueuse', 'nuit-luxueuse', 5, 1);

-- parcours en quatre étapes
-- homme : 5kg
-- femme : 6kg
call create_game('les-armes-secretes','Parcours lesté','parcours-leste-2021','parcours-leste','individuel','confort',21,31,'bora-bora,nuit-luxueuse','force,endurance,equilibre');
-- call fill_property('game','parcours-leste-2021','lest-initial-homme','6');
-- call fill_property('game','parcours-leste-2021','lest-initial-femme','3');

call create_game_participation('jonathan-2021','blanc-2021','parcours-leste-2021','participant','individuel',5,'');
call create_game_participation('magali-2021','blanc-2021','parcours-leste-2021','participant','individuel',6,'');
call create_game_participation('flavio-2021','blanc-2021','parcours-leste-2021','participant','individuel',2,'');
call create_game_participation('laure-2021','blanc-2021','parcours-leste-2021','participant','individuel',4,'bora-bora');
call create_game_participation('maxine-2021','blanc-2021','parcours-leste-2021','participant','individuel',1,'');
call create_game_participation('arnaud-2021','blanc-2021','parcours-leste-2021','participant','individuel',3,'');
call create_game_participation('lucie-2021','blanc-2021','parcours-leste-2021','participant','individuel',6,'');

-- Placement de boules avec corde
INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Elimination du dernier', 'elimination-du-dernier', 2, 0);

call create_game('les-armes-secretes','Placement de boules','placement-de-boules-2021','placement-de-boules','individuel','immunite',22,32,'elimination-du-dernier','rapidite,dexterite');

call create_game_participation('jonathan-2021','blanc-2021','placement-de-boules-2021','participant','individuel',5,'');
call create_game_participation('magali-2021','blanc-2021','placement-de-boules-2021','participant','individuel',6,'');
call create_game_participation('maxine-2021','blanc-2021','placement-de-boules-2021','participant','individuel',3,'');
call create_game_participation('arnaud-2021','blanc-2021','placement-de-boules-2021','participant','individuel',1,'totem');
call create_game_participation('lucie-2021','blanc-2021','placement-de-boules-2021','participant','individuel',4,'');
call create_game_participation('flavio-2021','blanc-2021','placement-de-boules-2021','participant','individuel',7,'elimination-du-dernier');
call create_game_participation('laure-2021','blanc-2021','placement-de-boules-2021','participant','individuel',2,'');

call create_participant_departure('les-armes-secretes','flavio-2021','blanc-2021',32,'elimination-du-dernier', @participant_team_id);

-- utilisation de l'arme secrete détournement de vote

call first_vote_against ('les-armes-secretes','lucie-2021','magali-2021','blanc-2021', 32, 'effectif');
call second_vote_against ('les-armes-secretes','lucie-2021','magali-2021','blanc-2021', 32, 'effectif');
call first_vote_against ('les-armes-secretes','arnaud-2021','lucie-2021','blanc-2021', 32, 'effectif');
call first_vote_against ('les-armes-secretes','jonathan-2021','lucie-2021','blanc-2021', 32, 'effectif');
call second_vote_against ('les-armes-secretes','jonathan-2021','lucie-2021','blanc-2021', 32, 'effectif');
call first_vote_against ('les-armes-secretes','maxine-2021','magali-2021','blanc-2021', 32, 'effectif');
call first_vote_against ('les-armes-secretes','laure-2021','magali-2021','blanc-2021', 32, 'effectif');

call create_participant_departure('les-armes-secretes','magali-2021','blanc-2021',32,'exclusion-par-vote', @participant_team_id);


