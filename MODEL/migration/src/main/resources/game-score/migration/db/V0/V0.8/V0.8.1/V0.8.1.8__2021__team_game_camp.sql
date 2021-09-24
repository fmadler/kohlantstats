INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Nourriture : riz', 'nourriture-poulet-frites', 5, 1);

call create_game('les-armes-secretes','Malle Puzzle','malle-puzzle-2021','puzzle','collectif','confort',11,16,'nourriture-riz,conseil','logic,rapidite,natation,relais');

call create_game_participation('herve-2021','rouge-2021','malle-puzzle-2021','participant','collectif',1,'conseil');
call create_game_participation('jonathan-2021','rouge-2021','malle-puzzle-2021','participant','collectif',1,'conseil');
call create_game_participation('frederic-2021','rouge-2021','malle-puzzle-2021','exempte-sur-raison-medicale','collectif',1,'conseil');
call create_game_participation('maxine-2021','rouge-2021','malle-puzzle-2021','participant','collectif',1,'conseil');
call create_game_participation('magali-2021','rouge-2021','malle-puzzle-2021','participant','collectif',1,'conseil');
call create_game_participation('arnaud-2021','rouge-2021','malle-puzzle-2021','participant','collectif',1,'conseil');
call create_game_participation('laure-2021','rouge-2021','malle-puzzle-2021','participant','collectif',1,'conseil');

call create_game_participation('laetitia-2021','jaune-2021','malle-puzzle-2021','participant','collectif',2,'nourriture-riz');
call create_game_participation('thomas-2021','jaune-2021','malle-puzzle-2021','participant','collectif',2,'nourriture-riz');
call create_game_participation('myriam-2021','jaune-2021','malle-puzzle-2021','participant','collectif',2,'nourriture-riz');
call create_game_participation('vincent-2021','jaune-2021','malle-puzzle-2021','participant','collectif',2,'nourriture-riz');
call create_game_participation('flavio-2021','jaune-2021','malle-puzzle-2021','participant','collectif',2,'nourriture-riz');
call create_game_participation('shanice-2021','jaune-2021','malle-puzzle-2021','exclusion-apres-tirage-au-sort','collectif',2,'nourriture-riz');
call create_game_participation('mathieu-2021','jaune-2021','malle-puzzle-2021','participant','collectif',2,'nourriture-riz');
call create_game_participation('lucie-2021','jaune-2021','malle-puzzle-2021','participant','collectif',2,'nourriture-riz');

INSERT INTO `GS_REALISATION_TYPE` (`WEB_PATH`, `NAME`) VALUES ('ambassadeur-par-choix-d-equipe', 'Ambassadeur par choix d''equipe');
INSERT INTO `GS_REALISATION_TYPE` (`WEB_PATH`, `NAME`) VALUES ('ambassadeur-par-choix-adverse', 'Ambassadeur par choix adverse');
INSERT INTO `GS_REALISATION_TYPE` (`WEB_PATH`, `NAME`) VALUES ('ambassadeur-cache', 'Ambassadeur cache');

call create_participant_realisation ('les-armes-secretes','laure-2021','rouge-2021',16,'ambassadeur-cache',@realisation_id);
call create_participant_realisation ('les-armes-secretes','vincent-2021','jaune-2021',16,'ambassadeur-par-choix-adverse',@realisation_id);
call create_participant_realisation ('les-armes-secretes','maxine-2021','rouge-2021',16,'ambassadeur-par-choix-adverse',@realisation_id);

call create_participant_departure ('les-armes-secretes','frederic-2021','rouge-2021',17,'recomposition-des-equipes', @participant_team_id);

call create_team('les-armes-secretes','Blanc','blanc-2021','Blanc',16,35);

call create_participant_entrance ('les-armes-secretes','herve-2021', 'blanc-2021', 16, 'reunification',@participant_team_id);
call create_participant_entrance ('les-armes-secretes','jonathan-2021', 'blanc-2021', 16, 'reunification',@participant_team_id);
call create_participant_entrance ('les-armes-secretes','maxine-2021', 'blanc-2021', 16, 'reunification',@participant_team_id);
call create_participant_entrance ('les-armes-secretes','arnaud-2021', 'blanc-2021', 16, 'reunification',@participant_team_id);
call create_participant_entrance ('les-armes-secretes','laure-2021', 'blanc-2021', 16, 'reunification',@participant_team_id);
call create_participant_entrance ('les-armes-secretes','laetitia-2021', 'blanc-2021', 16, 'reunification',@participant_team_id);
call create_participant_entrance ('les-armes-secretes','thomas-2021', 'blanc-2021', 16, 'reunification',@participant_team_id);
call create_participant_entrance ('les-armes-secretes','myriam-2021', 'blanc-2021', 16, 'reunification',@participant_team_id);
call create_participant_entrance ('les-armes-secretes','vincent-2021', 'blanc-2021', 16, 'reunification',@participant_team_id);
call create_participant_entrance ('les-armes-secretes','flavio-2021', 'blanc-2021', 16, 'reunification',@participant_team_id);
call create_participant_entrance ('les-armes-secretes','shanice-2021', 'blanc-2021', 16, 'reunification',@participant_team_id);
call create_participant_entrance ('les-armes-secretes','mathieu-2021', 'blanc-2021', 16, 'reunification',@participant_team_id);
call create_participant_entrance ('les-armes-secretes','lucie-2021', 'blanc-2021', 16, 'reunification',@participant_team_id);
call create_participant_entrance ('les-armes-secretes','magali-2021', 'blanc-2021', 16, 'reunification',@participant_team_id);

call create_game('les-armes-secretes','Parcours du combattant','parcours-du-combattant-2021','parcours-du-combattant','individuel','immunite',12,17,@participant_team_id,'force,rapidite,equilibre');

call create_game_participation('herve-2021','blanc-2021','parcours-du-combattant-2021','participant','individuel',2,'');
call create_game_participation('jonathan-2021','blanc-2021','parcours-du-combattant-2021','participant','individuel',0,'');
call create_game_participation('maxine-2021','blanc-2021','parcours-du-combattant-2021','participant','individuel',0,'');
call create_game_participation('arnaud-2021','blanc-2021','parcours-du-combattant-2021','participant','individuel',0,'');
call create_game_participation('laure-2021','blanc-2021','parcours-du-combattant-2021','participant','individuel',1,'totem');
call create_game_participation('laetitia-2021','blanc-2021','parcours-du-combattant-2021','participant','individuel',0,'');
call create_game_participation('thomas-2021','blanc-2021','parcours-du-combattant-2021','participant','individuel',0,'');
call create_game_participation('myriam-2021','blanc-2021','parcours-du-combattant-2021','participant','individuel',0,'');
call create_game_participation('vincent-2021','blanc-2021','parcours-du-combattant-2021','participant','individuel',0,'');
call create_game_participation('flavio-2021','blanc-2021','parcours-du-combattant-2021','participant','individuel',0,'');
call create_game_participation('shanice-2021','blanc-2021','parcours-du-combattant-2021','participant','individuel',0,'');
call create_game_participation('mathieu-2021','blanc-2021','parcours-du-combattant-2021','participant','individuel',0,'');
call create_game_participation('lucie-2021','blanc-2021','parcours-du-combattant-2021','participant','individuel',0,'');

call first_vote_against ('les-armes-secretes','laetitia-2021','arnaud-2021','blanc-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','mathieu-2021','herve-2021','blanc-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','flavio-2021','lucie-2021','blanc-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','shanice-2021','herve-2021','blanc-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','lucie-2021','arnaud-2021','blanc-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','vincent-2021','arnaud-2021','blanc-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','myriam-2021','herve-2021','blanc-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','herve-2021','thomas-2021','blanc-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','arnaud-2021','thomas-2021','blanc-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','magali-2021','jonathan-2021','blanc-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','thomas-2021','herve-2021','blanc-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','jonathan-2021','thomas-2021','blanc-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','maxine-2021','herve-2021','blanc-2021', 14, 'effectif');
call first_vote_against ('les-armes-secretes','laure-2021','herve-2021','blanc-2021', 14, 'effectif');

call create_participant_departure ('les-armes-secretes','herve-2021','blanc-2021',14,'exclusion-par-vote', @participant_team_id);

