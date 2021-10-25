call create_game('les-armes-secretes','Orientation','orientation-2021','orientation','individuel','finale',23,34,'poteaux','patience,logique,endurance');

call create_game_participation('jonathan-2021','blanc-2021','orientation-2021','participant','individuel',1,'');
call create_game_participation('laure-2021','blanc-2021','orientation-2021','participant','individuel',4,'bora-bora');
call create_game_participation('maxine-2021','blanc-2021','orientation-2021','participant','individuel',3,'');
call create_game_participation('arnaud-2021','blanc-2021','orientation-2021','participant','individuel',4,'');
call create_game_participation('lucie-2021','blanc-2021','orientation-2021','participant','individuel',2,'');

call create_participant_departure('les-armes-secretes','arnaud-2021','blanc-2021',34,'defaite-orientation', @participant_team_id);
call create_participant_departure('les-armes-secretes','laure-2021','blanc-2021',34,'defaite-orientation', @participant_team_id);


-- 2 
call create_game('les-armes-secretes','Poteaux','poteaux-2021','poteaux','individuel','finale',24,35,@participant_team_id,'equilibre,statique,patience');

call create_game_participation('jonathan-2021','blanc-2021','poteaux-2021','participant','individuel',3,'');
call create_game_participation('maxine-2021','blanc-2021','poteaux-2021','participant','individuel',1,'');
call create_game_participation('lucie-2021','blanc-2021','poteaux-2021','participant','individuel',2,'');

call create_participant_departure('les-armes-secretes','jonathan-2021','blanc-2021',35,'epreuve-poteaux', @participant_team_id);

call first_vote_for ('les-armes-secretes','laure-2021','maxine-2021','blanc-2021', 35, 'effectif');
call first_vote_for ('les-armes-secretes','arnaud-2021','maxine-2021','blanc-2021', 35, 'effectif');
call first_vote_for ('les-armes-secretes','magali-2021','lucie-2021','blanc-2021', 35, 'effectif');
call first_vote_for ('les-armes-secretes','flavio-2021','maxine-2021','blanc-2021', 35, 'effectif');
call first_vote_for ('les-armes-secretes','laetitia-2021','maxine-2021','blanc-2021', 35, 'effectif');
call first_vote_for ('les-armes-secretes','vincent-2021','maxine-2021','blanc-2021', 35, 'effectif');
call first_vote_for ('les-armes-secretes','thomas-2021','maxine-2021','blanc-2021', 35, 'effectif');
call first_vote_for ('les-armes-secretes','myriam-2021','maxine-2021','blanc-2021', 35, 'effectif');
call first_vote_for ('les-armes-secretes','shanice-2021','lucie-2021','blanc-2021', 35, 'effectif');
call first_vote_for ('les-armes-secretes','mathieu-2021','maxine-2021','blanc-2021', 35, 'effectif');
call first_vote_for ('les-armes-secretes','herve-2021','lucie-2021','blanc-2021', 35, 'effectif');
call first_vote_for ('les-armes-secretes','frederic-2021','lucie-2021','blanc-2021', 35, 'effectif');

call create_participant_departure('les-armes-secretes','maxine-2021','blanc-2021',35,'deliberation-jury-final', @participant_team_id);
call create_participant_departure('les-armes-secretes','lucie-2021','blanc-2021',35,'deliberation-jury-final', @participant_team_id);
