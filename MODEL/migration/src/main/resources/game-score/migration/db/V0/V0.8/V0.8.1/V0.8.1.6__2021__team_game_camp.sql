INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Nourriture : riz', 'nourriture-riz', 5, 1);

call create_game('les-armes-secretes','Puzzle construction gouttière','puzzle-gouttiere-2021','puzzle','collectif','confort',9,13,'nourriture-riz,conseil','logique,rapidite,precision');

call create_game_participation('herve-2021','rouge-2021','puzzle-gouttiere-2021','participant','collectif',2,'conseil');
call create_game_participation('jonathan-2021','rouge-2021','puzzle-gouttiere-2021','participant','collectif',2,'conseil');
call create_game_participation('frederic-2021','rouge-2021','puzzle-gouttiere-2021','exempte-sur-raison-medicale','collectif',2,'conseil');
call create_game_participation('maxine-2021','rouge-2021','puzzle-gouttiere-2021','participant','collectif',2,'conseil');
call create_game_participation('gabin-2021','rouge-2021','puzzle-gouttiere-2021','participant','collectif',2,'conseil');
call create_game_participation('magali-2021','rouge-2021','puzzle-gouttiere-2021','participant','collectif',2,'conseil');
call create_game_participation('arnaud-2021','rouge-2021','puzzle-gouttiere-2021','participant','collectif',2,'conseil');
call create_game_participation('laure-2021','rouge-2021','puzzle-gouttiere-2021','participant','collectif',2,'conseil');

call create_game_participation('aurelien-2021','jaune-2021','puzzle-gouttiere-2021','participant','collectif',1,'nourriture-riz');
call create_game_participation('laetitia-2021','jaune-2021','puzzle-gouttiere-2021','participant','collectif',1,'nourriture-riz');
call create_game_participation('thomas-2021','jaune-2021','puzzle-gouttiere-2021','participant','collectif',1,'nourriture-riz');
call create_game_participation('myriam-2021','jaune-2021','puzzle-gouttiere-2021','participant','collectif',1,'nourriture-riz');
call create_game_participation('vincent-2021','jaune-2021','puzzle-gouttiere-2021','participant','collectif',1,'nourriture-riz');
call create_game_participation('flavio-2021','jaune-2021','puzzle-gouttiere-2021','participant','collectif',1,'nourriture-riz');
call create_game_participation('shanice-2021','jaune-2021','puzzle-gouttiere-2021','exclusion-apres-tirage-au-sort','collectif',1,'nourriture-riz');
call create_game_participation('mathieu-2021','jaune-2021','puzzle-gouttiere-2021','participant','collectif',1,'nourriture-riz');
call create_game_participation('lucie-2021','jaune-2021','puzzle-gouttiere-2021','participant','collectif',1,'nourriture-riz');


-- conseil surprise
call first_vote_against ('les-armes-secretes','magali-2021','frederic-2021','rouge-2021', 13, 'effectif');
call first_vote_against ('les-armes-secretes','frederic-2021','magali-2021','rouge-2021', 13, 'effectif');
call first_vote_against ('les-armes-secretes','herve-2021','maxine-2021','rouge-2021', 13, 'effectif');
call first_vote_against ('les-armes-secretes','laure-2021','magali-2021','rouge-2021', 13, 'effectif');
call first_vote_against ('les-armes-secretes','gabin-2021','jonathan-2021','rouge-2021', 13, 'effectif');
call first_vote_against ('les-armes-secretes','maxine-2021','magali-2021','rouge-2021', 13, 'effectif');
call first_vote_against ('les-armes-secretes','arnaud-2021','magali-2021','rouge-2021', 13, 'effectif');
call first_vote_against ('les-armes-secretes','jonathan-2021','magali-2021','rouge-2021', 13, 'effectif');

call create_participant_departure ('les-armes-secretes','magali-2021','rouge-2021',13,'exclusion-par-vote', @participant_team_id);

call create_game('les-armes-secretes','Paresseux','paresseux-2021','paresseux','collectif','immunite',10,14,'','force,statique,patience,mental');

-- todo gabin infirmerie

call create_game_participation('herve-2021','rouge-2021','paresseux-2021','participant','collectif',1,'');
call create_game_participation('jonathan-2021','rouge-2021','paresseux-2021','participant','collectif',1,'');
call create_game_participation('frederic-2021','rouge-2021','paresseux-2021','participant','collectif',1,'');
call create_game_participation('maxine-2021','rouge-2021','paresseux-2021','participant','collectif',1,'');
call create_game_participation('gabin-2021','rouge-2021','paresseux-2021','infirmerie','collectif',1,'');
call create_game_participation('arnaud-2021','rouge-2021','paresseux-2021','participant','collectif',1,'');
call create_game_participation('laure-2021','rouge-2021','paresseux-2021','participant','collectif',1,'');

call create_game_participation('aurelien-2021','jaune-2021','paresseux-2021','participant','collectif',2,'totem');
call create_game_participation('laetitia-2021','jaune-2021','paresseux-2021','exclusion-apres-tirage-au-sort','collectif',2,'totem');
call create_game_participation('thomas-2021','jaune-2021','paresseux-2021','participant','collectif',2,'totem');
call create_game_participation('myriam-2021','jaune-2021','paresseux-2021','participant','collectif',2,'totem');
call create_game_participation('vincent-2021','jaune-2021','paresseux-2021','participant','collectif',2,'totem');
call create_game_participation('flavio-2021','jaune-2021','paresseux-2021','participant','collectif',2,'totem');
call create_game_participation('shanice-2021','jaune-2021','paresseux-2021','participant','collectif',2,'totem');
call create_game_participation('mathieu-2021','jaune-2021','paresseux-2021','exempte-par-choix','collectif',2,'totem');
call create_game_participation('lucie-2021','jaune-2021','paresseux-2021','exclusion-apres-tirage-au-sort','collectif',2,'totem');

call create_participant_departure ('les-armes-secretes','gabin-2021','rouge-2021',14,'abandon-medical', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','magali-2021','rouge-2021',14,'remplacement', @participant_team_id);

-- TODO depart gabin, retour magali

call first_vote_against ('les-armes-secretes','laetitia-2021','lucie-2021','jaune-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','mathieu-2021','lucie-2021','jaune-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','aurelien-2021','lucie-2021','jaune-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','flavio-2021','lucie-2021','jaune-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','shanice-2021','aurelien-2021','jaune-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','lucie-2021','aurelien-2021','jaune-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','vincent-2021','aurelien-2021','jaune-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','thomas-2021','aurelien-2021','jaune-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','myriam-2021','aurelien-2021','jaune-2021', 14, 'effectif');

--
/*
latitia > lucie
mathieu > lucie
aurelein > lucie
flavio > lucie
shanice > aurelien
lucie > aurélien
vincent > aurelien
thomas > aurelien
myriam > aurelien
*/

call create_participant_departure ('les-armes-secretes','aurelien-2021','jaune-2021',14,'exclusion-par-vote', @participant_team_id);

-- realisation

call create_participant_realisation('les-armes-secretes','laure-2021','rouge-2021',14,'decouverte-arme-secrete',@realisation_id);
