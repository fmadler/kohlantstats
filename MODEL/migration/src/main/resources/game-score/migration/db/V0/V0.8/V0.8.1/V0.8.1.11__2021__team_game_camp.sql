INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Comme à la maison', 'comme-a-la-maison', 5, 1);

call create_game('les-armes-secretes','Koala à deux','koala-a-deux-2021','koala','binome','confort',17,24,'comme-a-la-maison','statique,equilibre,endurance,resistance');

call create_game_participation('jonathan-2021','blanc-2021','koala-a-deux-2021','participant','binome',2,'comme-a-la-maison');
call create_game_participation('magali-2021','blanc-2021','koala-a-deux-2021','participant','binome',2,'comme-a-la-maison');
call create_game_participation('flavio-2021','blanc-2021','koala-a-deux-2021','participant','binome',1,'comme-a-la-maison');
call create_game_participation('laure-2021','blanc-2021','koala-a-deux-2021','participant','binome',1,'comme-a-la-maison');
call create_game_participation('vincent-2021','blanc-2021','koala-a-deux-2021','participant','binome',4,'');
call create_game_participation('laetitia-2021','blanc-2021','koala-a-deux-2021','participant','binome',4,'');
call create_game_participation('thomas-2021','blanc-2021','koala-a-deux-2021','participant','binome',3,'');
call create_game_participation('maxine-2021','blanc-2021','koala-a-deux-2021','participant','binome',3,'');
call create_game_participation('arnaud-2021','blanc-2021','koala-a-deux-2021','participant','binome',5,'');
call create_game_participation('lucie-2021','blanc-2021','koala-a-deux-2021','participant','binome',5,'');

call create_participant_realisation('les-armes-secretes','laetitia-2021','blanc-2021',25,'decouverte-collier-immunite',@realisation_id);
-- 2 
call create_game('les-armes-secretes','Diabolo','diabolo-2021','diabolo','binome','immunite',18,26,@participant_team_id,'rapidite,equilibre');

-- inédit planche à bascule, echange pallet contre bamboo
call create_game_participation('jonathan-2021','blanc-2021','diabolo-2021','participant','binome',0,'');
call create_game_participation('magali-2021','blanc-2021','diabolo-2021','participant','binome',0,'');
call create_game_participation('thomas-2021','blanc-2021','diabolo-2021','participant','binome',0,'');
call create_game_participation('maxine-2021','blanc-2021','diabolo-2021','participant','binome',0,'');
call create_game_participation('arnaud-2021','blanc-2021','diabolo-2021','participant','binome',1,'totem');
call create_game_participation('lucie-2021','blanc-2021','diabolo-2021','participant','binome',1,'totem');
call create_game_participation('flavio-2021','blanc-2021','diabolo-2021','participant','binome',0,'');
call create_game_participation('laure-2021','blanc-2021','diabolo-2021','participant','binome',0,'');
call create_game_participation('vincent-2021','blanc-2021','diabolo-2021','participant','binome',6,'');
call create_game_participation('laetitia-2021','blanc-2021','diabolo-2021','participant','binome',1,'');


call create_participant_realisation('les-armes-secretes','lucie-2021','blanc-2021',26,'decouverte-arme-secrete',@realisation_id);
-- bracelet noir

call first_vote_against ('les-armes-secretes','laetitia-2021','thomas-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','flavio-2021','magali-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','lucie-2021','vincent-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','vincent-2021','magali-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','arnaud-2021','vincent-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','magali-2021','vincent-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','thomas-2021','vincent-2021','blanc-2021', 23, 'effectif');
call second_vote_against ('les-armes-secretes','thomas-2021','vincent-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','jonathan-2021','vincent-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','maxine-2021','vincent-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','laure-2021','vincent-2021','blanc-2021', 23, 'effectif');

call create_participant_departure('les-armes-secretes','vincent-2021','blanc-2021',24,'exclusion-par-vote', @participant_team_id);
call create_participant_departure('les-armes-secretes','laetitia-2021','blanc-2021',24,'exclusion-par-vote', @participant_team_id);

