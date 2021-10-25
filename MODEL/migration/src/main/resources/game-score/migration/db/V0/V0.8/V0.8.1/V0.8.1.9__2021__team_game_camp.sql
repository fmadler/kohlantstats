INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Découverte du lagon en catamaran', 'decouverte-catamaran', 5, 1);
INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Contact famille', 'contact-famille', 7, 1);
INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Duel', 'duel', 2, 0);
INSERT INTO `GS_TEAM_DEPARTURE_TYPE` (`NAME`, `WEB_PATH`) VALUES ('Exclusion par duel', 'exclusion-par-duel');

call create_game('les-armes-secretes','Tir à l''arc','tir-a-l-arc-2021','fleche-cassee','individuel','confort',13,19,'decouverte-catamaran,contact-famille','precision,strategie');


call create_game_participation('jonathan-2021','blanc-2021','tir-a-l-arc-2021','participant','individuel',12,'');
call create_game_participation('maxine-2021','blanc-2021','tir-a-l-arc-2021','participant','individuel',11,'');
call create_game_participation('magali-2021','blanc-2021','tir-a-l-arc-2021','participant','individuel',7,'');
call create_game_participation('arnaud-2021','blanc-2021','tir-a-l-arc-2021','participant','individuel',9,'');
call create_game_participation('laure-2021','blanc-2021','tir-a-l-arc-2021','participant','individuel',13,'');
call create_game_participation('laetitia-2021','blanc-2021','tir-a-l-arc-2021','participant','individuel',8,'');
call create_game_participation('thomas-2021','blanc-2021','tir-a-l-arc-2021','participant','individuel',4,'');
call create_game_participation('myriam-2021','blanc-2021','tir-a-l-arc-2021','participant','individuel',1,'decouverte-catamaran,contact-famille');
call create_game_participation('vincent-2021','blanc-2021','tir-a-l-arc-2021','participant','individuel',5,'');
call create_game_participation('flavio-2021','blanc-2021','tir-a-l-arc-2021','participant','individuel',6,'');
call create_game_participation('shanice-2021','blanc-2021','tir-a-l-arc-2021','participant','individuel',2,'decouverte-catamaran,contact-famille');
call create_game_participation('mathieu-2021','blanc-2021','tir-a-l-arc-2021','participant','individuel',3,'');
call create_game_participation('lucie-2021','blanc-2021','tir-a-l-arc-2021','participant','individuel',10,'');



call create_game('les-armes-secretes','Figure de proue','figure-de-proue-2021','figure-de-proue','individuel','immunite',13,20,@participant_team_id,'force,statique,equilibre');

call create_game_participation('jonathan-2021','blanc-2021','figure-de-proue-2021','participant','individuel',1,'totem');
call create_game_participation('maxine-2021','blanc-2021','figure-de-proue-2021','participant','individuel',3,'');
call create_game_participation('magali-2021','blanc-2021','figure-de-proue-2021','participant','individuel',8,'');
call create_game_participation('arnaud-2021','blanc-2021','figure-de-proue-2021','participant','individuel',11,'');
call create_game_participation('laure-2021','blanc-2021','figure-de-proue-2021','participant','individuel',5,'');
call create_game_participation('laetitia-2021','blanc-2021','figure-de-proue-2021','participant','individuel',7,'');
call create_game_participation('thomas-2021','blanc-2021','figure-de-proue-2021','participant','individuel',12,'');
call create_game_participation('myriam-2021','blanc-2021','figure-de-proue-2021','participant','individuel',6,'');
call create_game_participation('vincent-2021','blanc-2021','figure-de-proue-2021','participant','individuel',9,'');
call create_game_participation('flavio-2021','blanc-2021','figure-de-proue-2021','participant','individuel',2,'');
call create_game_participation('shanice-2021','blanc-2021','figure-de-proue-2021','participant','individuel',4,'');
call create_game_participation('mathieu-2021','blanc-2021','figure-de-proue-2021','participant','individuel',13,'duel');
call create_game_participation('lucie-2021','blanc-2021','figure-de-proue-2021','participant','individuel',10,'');

/*
TODO modeling
call create_game('les-armes-secretes','Equilibre boules','equilibre-boules-2021','empillement-de-boules','immunite,exlusion-immediate',2020,@participant_team_id,'rapidite,equilibre');

call create_game_participation('thomas-2021','blanc-2021','equilibre-boules-2021','participant','individuel',1,'immunite');
call create_game_participation('mathieu-2021','blanc-2021','equilibre-boules-2021','participant','individuel',2,'exlusion-immediate');
*/
call create_participant_departure('les-armes-secretes','mathieu-2021','blanc-2021',20,'exclusion-par-duel', @participant_team_id);


call first_vote_against ('les-armes-secretes','laetitia-2021','laure-2021','blanc-2021', 20, 'effectif');
call first_vote_against ('les-armes-secretes','flavio-2021','laure-2021','blanc-2021', 20, 'effectif');
call first_vote_against ('les-armes-secretes','shanice-2021','laure-2021','blanc-2021', 20, 'effectif');
call first_vote_against ('les-armes-secretes','lucie-2021','laure-2021','blanc-2021', 20, 'effectif');
call first_vote_against ('les-armes-secretes','vincent-2021','shanice-2021','blanc-2021', 20, 'effectif');
call first_vote_against ('les-armes-secretes','myriam-2021','laure-2021','blanc-2021', 20, 'effectif');
call first_vote_against ('les-armes-secretes','arnaud-2021','shanice-2021','blanc-2021', 20, 'effectif');
call first_vote_against ('les-armes-secretes','magali-2021','shanice-2021','blanc-2021', 20, 'effectif');
call first_vote_against ('les-armes-secretes','thomas-2021','laure-2021','blanc-2021', 20, 'effectif');
call first_vote_against ('les-armes-secretes','jonathan-2021','shanice-2021','blanc-2021', 20, 'effectif');
call second_vote_against ('les-armes-secretes','jonathan-2021','shanice-2021','blanc-2021', 20, 'effectif');
call first_vote_against ('les-armes-secretes','maxine-2021','shanice-2021','blanc-2021', 20, 'effectif');
call first_vote_against ('les-armes-secretes','laure-2021','shanice-2021','blanc-2021', 20, 'effectif');

call create_participant_departure('les-armes-secretes','shanice-2021','blanc-2021',20,'exclusion-par-vote', @participant_team_id);

