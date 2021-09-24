INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Nuit à l''hotel', 'nuit-hotel', 5, 1);
INSERT INTO `GS_GAME_ACTIVITY_TYPE` (`NAME`, `WEB_PATH`) VALUES ('Exclusion par choix d''équipe', 'exclusion-par-choix-d-equipe');

-- indivuel mais en équipe recomposé
-- INSERT INTO `GS_GAME_PARTICIPATION_TYPE` (`ID`, `NAME`, `WEB_PATH`) VALUES (5, 'Equipe composée', 'equipe-composee');
call create_game('les-armes-secretes','Domino en équilibre','domino-2021','domino','equipe-composee','confort',15,21,'nuit-hotel','precision,dexterite,equilibre');

call create_game_participation('jonathan-2021','blanc-2021','domino-2021','participant','equipe-composee',2,'');
call create_game_participation('maxine-2021','blanc-2021','domino-2021','participant','equipe-composee',2,'');
call create_game_participation('magali-2021','blanc-2021','domino-2021','participant','equipe-composee',2,'');
call create_game_participation('arnaud-2021','blanc-2021','domino-2021','participant','equipe-composee',2,'');
call create_game_participation('laure-2021','blanc-2021','domino-2021','participant','equipe-composee',2,'');
call create_game_participation('laetitia-2021','blanc-2021','domino-2021','participant','equipe-composee',1,'nuit-hotel');
call create_game_participation('thomas-2021','blanc-2021','domino-2021','participant','equipe-composee',1,'nuit-hotel');
call create_game_participation('myriam-2021','blanc-2021','domino-2021','participant','equipe-composee',1,'nuit-hotel');
call create_game_participation('vincent-2021','blanc-2021','domino-2021','participant','equipe-composee',1,'nuit-hotel');
call create_game_participation('flavio-2021','blanc-2021','domino-2021','participant','equipe-composee',1,'nuit-hotel');
call create_game_participation('lucie-2021','blanc-2021','domino-2021','exclusion-par-choix-d-equipe','individuel',10,'');

call create_participant_realisation('les-armes-secretes','lucie-2021','blanc-2021',21,'decouverte-arme-secrete',@realisation_id);
-- 2
-- INSERT INTO `GS_GAME_PARTICIPATION_TYPE` (`ID`, `NAME`, `WEB_PATH`) VALUES (6, 'Individuel dans l''équipe composée', 'individuel-equipe-composee');
call create_game('les-armes-secretes','Bouées','bouees-2021','bouee','individuel-equipe-composee','immunite',16,22,@participant_team_id,'force,statique,equilibre');

call create_game_participation('jonathan-2021','blanc-2021','bouees-2021','participant','individuel-equipe-composee',3,'');
call create_game_participation('maxine-2021','blanc-2021','bouees-2021','participant','individuel-equipe-composee',1,'totem');
call create_game_participation('magali-2021','blanc-2021','bouees-2021','participant','individuel-equipe-composee',4,'');
call create_game_participation('arnaud-2021','blanc-2021','bouees-2021','participant','individuel-equipe-composee',5,'vote-contre-soi');
call create_game_participation('laure-2021','blanc-2021','bouees-2021','participant','individuel-equipe-composee',2,'');
call create_game_participation('laetitia-2021','blanc-2021','bouees-2021','participant','individuel-equipe-composee',1,'totem');
call create_game_participation('thomas-2021','blanc-2021','bouees-2021','participant','individuel-equipe-composee',3,'');
call create_game_participation('myriam-2021','blanc-2021','bouees-2021','participant','individuel-equipe-composee',2,'');
call create_game_participation('vincent-2021','blanc-2021','bouees-2021','participant','individuel-equipe-composee',6,'vote-contre-soi');
call create_game_participation('flavio-2021','blanc-2021','bouees-2021','participant','individuel-equipe-composee',4,'');
call create_game_participation('lucie-2021','blanc-2021','bouees-2021','participant','individuel-equipe-composee',5,'');

call first_vote_against ('les-armes-secretes','laetitia-2021','myriam-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','flavio-2021','arnaud-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','lucie-2021','myriam-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','vincent-2021','myriam-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','myriam-2021','arnaud-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','arnaud-2021','myriam-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','magali-2021','myriam-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','thomas-2021','arnaud-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','jonathan-2021','myriam-2021','blanc-2021', 23, 'effectif');
call second_vote_against ('les-armes-secretes','myriam-2021','arnaud-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','maxine-2021','myriam-2021','blanc-2021', 23, 'effectif');
call first_vote_against ('les-armes-secretes','laure-2021','myriam-2021','blanc-2021', 23, 'effectif');

call create_participant_departure('les-armes-secretes','myriam-2021','blanc-2021',23,'exclusion-par-vote', @participant_team_id);

