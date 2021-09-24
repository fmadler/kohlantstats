INSERT INTO `GS_GAME_TYPE` (`NAME`, `WEB_PATH`, `DESCRIPTION`) VALUES ('Basket avec noix de coco lesté', 'basket-coco', NULL);

call create_game('la-legende-2021','Basket coco','basket-coco-2021','basket-coco','individuel','immunite',3,4,'amulette-d-immunite,avantage-strategique,vote-contre','adresse,rapidite,equilibre');


call create_game_participation('claude-2010','arrivee-homme-2021','basket-coco-2021','participant','individuel',6,'');
call create_program_game_participation('la-legende-2021','loic-2020','arrivee-homme-2021','basket-coco-2021','participant','individuel',1,'amulette-d-immunite,avantage-strategique');
call create_game_participation('teheiura-2011','arrivee-homme-2021','basket-coco-2021','participant','individuel',2,'amulette-d-immunite');
call create_game_participation('maxime-2019','arrivee-homme-2021','basket-coco-2021','participant','individuel',5,'');
call create_game_participation('laurent-2011','arrivee-homme-2021','basket-coco-2021','participant','individuel',8,'vote-contre-soi');
call create_game_participation('sam-2018','arrivee-homme-2021','basket-coco-2021','participant','individuel',4,'');
call create_game_participation('phil-2012','arrivee-homme-2021','basket-coco-2021','participant','individuel',7,'');
call create_game_participation('namadia-2012','arrivee-homme-2021','basket-coco-2021','participant','individuel',3,'');
call create_game_participation('patrick-2009','arrivee-homme-2021','basket-coco-2021','participant','individuel',8,'vote-contre-soi');


call create_game('la-legende-2021','Figure de proue','figure-de-proue-2021-2','figure-de-proue','individuel','immunite',4,5,'amulette-d-immunite,avantage-strategique,vote-contre-soi','statique,force');

call create_game_participation('coumba-2010','arrivee-femme-2021','figure-de-proue-2021-2','participant','individuel',6,'');
call create_game_participation('clementine-2017','arrivee-femme-2021','figure-de-proue-2021-2','participant','individuel',7,'');
call create_game_participation('christelle-2008','arrivee-femme-2021','figure-de-proue-2021-2','participant','individuel',8,'vote-contre-soi');
call create_game_participation('clemence-2005','arrivee-femme-2021','figure-de-proue-2021-2','participant','individuel',1,'amulette-d-immunite,avantage-strategique');
call create_game_participation('jade-2007','arrivee-femme-2021','figure-de-proue-2021-2','participant','individuel',2,'amulette-d-immunite');
call create_program_game_participation('la-legende-2021','alexandra-2020','arrivee-femme-2021','figure-de-proue-2021-2','participant','individuel',4,'');
call create_game_participation('candice-2016','arrivee-femme-2021','figure-de-proue-2021-2','participant','individuel',5,'');
call create_game_participation('cindy-2019','arrivee-femme-2021','figure-de-proue-2021-2','participant','individuel',9,'vote-contre-soi');
call create_program_game_participation('la-legende-2021','alix-2020','arrivee-femme-2021','figure-de-proue-2021-2','participant','individuel',3,'');

-- immunité offerte par loïc à alexandra
-- immunité offerte par clémence à maxime

call first_vote_against ('la-legende-2021','alexandra-2020','cindy-2019','arrivee-femme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','christelle-2008','cindy-2019','arrivee-femme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','coumba-2010','alexandra-2020','arrivee-femme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','jade-2007','cindy-2019','arrivee-femme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','alix-2020','cindy-2019','arrivee-femme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','cindy-2019','alexandra-2020','arrivee-femme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','clemence-2005','cindy-2019','arrivee-femme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','clementine-2017','alexandra-2020','arrivee-femme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','candice-2016','cindy-2019','arrivee-femme-2021', 6, 'effectif');

call create_participant_departure('la-legende-2021','cindy-2019','arrivee-femme-2021',6,'exclusion-par-vote', @participant_team_id);


call first_vote_against ('la-legende-2021','loic-2020','patrick-2009','arrivee-homme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','patrick-2009','maxime-2019','arrivee-homme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','claude-2010','maxime-2019','arrivee-homme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','phil-2012','patrick-2009','arrivee-homme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','sam-2018','patrick-2009','arrivee-homme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','maxime-2019','patrick-2009','arrivee-homme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','teheiura-2011','patrick-2009','arrivee-homme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','laurent-2011','maxime-2019','arrivee-homme-2021', 6, 'effectif');
call first_vote_against ('la-legende-2021','namadia-2012','patrick-2009','arrivee-homme-2021', 6, 'effectif');

call create_participant_departure('la-legende-2021','patrick-2009','arrivee-homme-2021',6,'exclusion-par-vote', @participant_team_id);


-- arrivee sur l'ile des bannis
-- karima, ugo entrance le 3
-- cindy, patrick entrance le 6
call create_participant_entrance ('la-legende-2021','patrick-2009','ile-des-bannis-2021',6,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('la-legende-2021','cindy-2019','ile-des-bannis-2021',6,'constitution-des-equipes', @participant_team_id);

