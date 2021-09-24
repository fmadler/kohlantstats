INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Comme au restaurant', 'comme-au-restaurant', 5, 1);

INSERT INTO `GS_REWARD_TYPE` (`NAME`, `WEB_PATH`) VALUES ('Bien-être personnel', 'bien-etre-personnel');
set @GS_REWARD_TYPE_ID = LAST_INSERT_ID();
INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Courrier', 'courrier', @GS_REWARD_TYPE_ID, 1);

call create_game('les-armes-secretes','L''étoile','l-etoile-2021','etoile','individuel','confort',19,28,'comme-au-restaurant,courrier','statique,endurance,resistance,equilibre');

call create_game_participation('jonathan-2021','blanc-2021','l-etoile-2021','participant','individuel',1,'courrier');
call create_game_participation('magali-2021','blanc-2021','l-etoile-2021','participant','individuel',3,'');
call create_game_participation('flavio-2021','blanc-2021','l-etoile-2021','participant','individuel',7,'');
call create_game_participation('laure-2021','blanc-2021','l-etoile-2021','participant','individuel',2,'');
call create_game_participation('thomas-2021','blanc-2021','l-etoile-2021','participant','individuel',8,'');
call create_game_participation('maxine-2021','blanc-2021','l-etoile-2021','participant','individuel',6,'comme-au-restaurant');
call create_game_participation('arnaud-2021','blanc-2021','l-etoile-2021','participant','individuel',5,'');
call create_game_participation('lucie-2021','blanc-2021','l-etoile-2021','participant','individuel',4,'comme-au-restaurant');

-- 2 
call create_game('les-armes-secretes','Parcours en cinq étapes','parcours-en-cinq-etapes-2021','parcours-en-cinq-etapes','individuel','immunite',20,29,@participant_team_id,'rapidite,equilibre');

-- inédit planche à bascule, echange pallet contre bamboo
call create_game_participation('jonathan-2021','blanc-2021','parcours-en-cinq-etapes-2021','participant','individuel',0,'');
call create_game_participation('magali-2021','blanc-2021','parcours-en-cinq-etapes-2021','participant','individuel',0,'');
call create_game_participation('thomas-2021','blanc-2021','parcours-en-cinq-etapes-2021','participant','individuel',0,'');
call create_game_participation('maxine-2021','blanc-2021','parcours-en-cinq-etapes-2021','participant','individuel',1,'totem');
call create_game_participation('arnaud-2021','blanc-2021','parcours-en-cinq-etapes-2021','participant','individuel',2,'');
call create_game_participation('lucie-2021','blanc-2021','parcours-en-cinq-etapes-2021','participant','individuel',0,'');
call create_game_participation('flavio-2021','blanc-2021','parcours-en-cinq-etapes-2021','participant','individuel',3,'');
call create_game_participation('laure-2021','blanc-2021','parcours-en-cinq-etapes-2021','participant','individuel',0,'');

-- jour 30
call first_vote_against ('les-armes-secretes','flavio-2021','thomas-2021','blanc-2021', 30, 'effectif');
call first_vote_against ('les-armes-secretes','lucie-2021','thomas-2021','blanc-2021', 30, 'effectif');
call first_vote_against ('les-armes-secretes','arnaud-2021','thomas-2021','blanc-2021', 30, 'effectif');
call first_vote_against ('les-armes-secretes','magali-2021','thomas-2021','blanc-2021', 30, 'effectif');
call first_vote_against ('les-armes-secretes','thomas-2021','flavio-2021','blanc-2021', 30, 'effectif');
call second_vote_against ('les-armes-secretes','flavio-2021','thomas-2021','blanc-2021', 30, 'effectif');
call first_vote_against ('les-armes-secretes','jonathan-2021','thomas-2021','blanc-2021', 30, 'effectif');
call first_vote_against ('les-armes-secretes','maxine-2021','thomas-2021','blanc-2021', 30, 'effectif');
call first_vote_against ('les-armes-secretes','laure-2021','thomas-2021','blanc-2021', 30, 'effectif');

call create_participant_departure('les-armes-secretes','thomas-2021','blanc-2021',30,'exclusion-par-vote', @participant_team_id);

