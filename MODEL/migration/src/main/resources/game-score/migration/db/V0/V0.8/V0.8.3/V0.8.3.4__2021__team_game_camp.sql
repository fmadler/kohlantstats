INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Amulette d''immunite', 'amulette-d-immunite', 1, 1);
INSERT INTO `GS_REWARD` (`NAME`, `WEB_PATH`, `GS_REWARD_TYPE_ID`, `IS_POSITIVE`) VALUES ('Avantage strategique', 'avantage-strategique', 14, 1);

call create_game('la-legende-2021','Parcours du combattant','parcours-du-combattant-2021-2','parcours-du-combattant','individuel','immunite',1,1,'amulette-d-immunite,avantage-strategique,vote-contre','force,endurance,rapidite');


call create_game_participation('ugo-2012','arrivee-homme-2021','parcours-du-combattant-2021-2','participant','individuel',3,'');
call create_game_participation('claude-2010','arrivee-homme-2021','parcours-du-combattant-2021-2','participant','individuel',1,'amulette-d-immunite,avantage-strategique');
call create_game_participation('freddy-2010','arrivee-homme-2021','parcours-du-combattant-2021-2','participant','individuel',9,'vote-contre-soi');
call create_game_participation('teheiura-2011','arrivee-homme-2021','parcours-du-combattant-2021-2','participant','individuel',7,'');
call create_game_participation('maxime-2019','arrivee-homme-2021','parcours-du-combattant-2021-2','participant','individuel',8,'');
call create_game_participation('laurent-2011','arrivee-homme-2021','parcours-du-combattant-2021-2','participant','individuel',2,'amulette-d-immunite');
call create_game_participation('sam-2018','arrivee-homme-2021','parcours-du-combattant-2021-2','participant','individuel',9,'vote-contre-soi');
call create_game_participation('phil-2012','arrivee-homme-2021','parcours-du-combattant-2021-2','participant','individuel',6,'');
call create_game_participation('namadia-2012','arrivee-homme-2021','parcours-du-combattant-2021-2','participant','individuel',7,'');
call create_game_participation('patrick-2009','arrivee-homme-2021','parcours-du-combattant-2021-2','participant','individuel',4,'');


call create_game('la-legende-2021','Grapin','grapin-2021','grapin','individuel','immunite',2,1,'amlette-d-immunite,avantage-strategique,vote-contre-soi','rapidite,dexterite');

call create_game_participation('coumba-2010','arrivee-femme-2021','grapin-2021','participant','individuel',1,'amulette-d-immunite,avantage-strategique');
call create_game_participation('clementine-2017','arrivee-femme-2021','grapin-2021','participant','individuel',9,'vote-contre-soi');
call create_game_participation('christelle-2008','arrivee-femme-2021','grapin-2021','participant','individuel',3,'');
call create_game_participation('clemence-2005','arrivee-femme-2021','grapin-2021','participant','individuel',4,'');
call create_game_participation('jade-2007','arrivee-femme-2021','grapin-2021','participant','individuel',5,'');
call create_program_game_participation('la-legende-2021','alexandra-2020','arrivee-femme-2021','grapin-2021','participant','individuel',9,'vote-contre-soi');
call create_game_participation('candice-2016','arrivee-femme-2021','grapin-2021','participant','individuel',6,'');
call create_game_participation('cindy-2019','arrivee-femme-2021','grapin-2021','participant','individuel',7,'');
call create_game_participation('karima-2016','arrivee-femme-2021','grapin-2021','participant','individuel',8,'');
call create_program_game_participation('la-legende-2021','alix-2020','arrivee-femme-2021','grapin-2021','participant','individuel',2,'amulette-d-immunite');

call first_vote_against ('la-legende-2021','alexandra-2020','karima-2016','arrivee-femme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','christelle-2008','clemence-2005','arrivee-femme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','coumba-2010','clemence-2005','arrivee-femme-2021', 3, 'effectif');
call second_vote_against ('la-legende-2021','coumba-2010','clemence-2005','arrivee-femme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','jade-2007','clemence-2005','arrivee-femme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','alix-2020','karima-2016','arrivee-femme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','cindy-2019','karima-2016','arrivee-femme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','clemence-2005','karima-2016','arrivee-femme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','clementine-2017','karima-2016','arrivee-femme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','candice-2016','karima-2016','arrivee-femme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','karima-2016','clemence-2005','arrivee-femme-2021', 3, 'effectif');

call create_participant_departure('la-legende-2021','karima-2016','arrivee-femme-2021',3,'exclusion-par-vote', @participant_team_id);

call create_participant_departure('la-legende-2021','freddy-2010','arrivee-homme-2021',2,'abandon-medical', @participant_team_id);

call create_participant_realisation ('la-legende-2021','sam-2018','arrivee-homme-2021',2,'allumage-du-feu',@realisation_id);

call add_participant('la-legende-2021', 'Loïc', '21', 'loic-2020', 'H', null, null, 9, '', ''); 

call create_participant_entrance ('la-legende-2021','loic-2020','arrivee-homme-2021',3,'remplacement', @participant_team_id);

call first_vote_against ('la-legende-2021','ugo-2012','patrick-2009','arrivee-homme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','patrick-2009','ugo-2012','arrivee-homme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','claude-2010','ugo-2012','arrivee-homme-2021', 3, 'effectif');
call second_vote_against ('la-legende-2021','claude-2010','ugo-2012','arrivee-homme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','phil-2012','ugo-2012','arrivee-homme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','sam-2018','patrick-2009','arrivee-homme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','maxime-2019','ugo-2012','arrivee-homme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','teheiura-2011','ugo-2012','arrivee-homme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','laurent-2011','ugo-2012','arrivee-homme-2021', 3, 'effectif');
call first_vote_against ('la-legende-2021','namadia-2012','ugo-2012','arrivee-homme-2021', 3, 'effectif');
-- vote contre sam, freddy

call create_participant_departure('la-legende-2021','ugo-2012','arrivee-homme-2021',3,'exclusion-par-vote', @participant_team_id);

call create_team('la-legende-2021','Ile des bannis','ile-des-bannis-2021','Ile des bannis',3,15);

-- TODO ajouter les membres
call create_participant_entrance ('la-legende-2021','karima-2016','ile-des-bannis-2021',3,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','ugo-2012','ile-des-bannis-2021',3,'constitution-des-equipes', @participant_team_id);


