call create_game('les-armes-secretes','Massacre avec jet de massue','massacre-avec-massue-2021','massacre','collectif','confort',7,10,'kit-peche,allumettes','force,precision');

call create_game_participation('candice-2021','rouge-2021','massacre-avec-massue-2021','participant','collectif',2,'');
call create_game_participation('herve-2021','rouge-2021','massacre-avec-massue-2021','participant','collectif',2,'');
call create_game_participation('jonathan-2021','rouge-2021','massacre-avec-massue-2021','participant','collectif',2,'');
call create_game_participation('frederic-2021','rouge-2021','massacre-avec-massue-2021','exempte-sur-raison-medicale','collectif',2,'');
call create_game_participation('maxine-2021','rouge-2021','massacre-avec-massue-2021','participant','collectif',2,'');
call create_game_participation('gabin-2021','rouge-2021','massacre-avec-massue-2021','participant','collectif',2,'');
call create_game_participation('magali-2021','rouge-2021','massacre-avec-massue-2021','participant','collectif',2,'');
call create_game_participation('arnaud-2021','rouge-2021','massacre-avec-massue-2021','participant','collectif',2,'');
call create_game_participation('laure-2021','rouge-2021','massacre-avec-massue-2021','participant','collectif',2,'');

call create_game_participation('aurelien-2021','jaune-2021','massacre-avec-massue-2021','participant','collectif',1,'kit-peche');
call create_game_participation('laetitia-2021','jaune-2021','massacre-avec-massue-2021','participant','collectif',1,'kit-peche');
call create_game_participation('thomas-2021','jaune-2021','massacre-avec-massue-2021','participant','collectif',1,'kit-peche');
call create_game_participation('myriam-2021','jaune-2021','massacre-avec-massue-2021','participant','collectif',1,'kit-peche');
call create_game_participation('vincent-2021','jaune-2021','massacre-avec-massue-2021','exempte-par-choix','collectif',1,'kit-peche');
call create_game_participation('flavio-2021','jaune-2021','massacre-avec-massue-2021','participant','collectif',1,'kit-peche');
call create_game_participation('shanice-2021','jaune-2021','massacre-avec-massue-2021','exclusion-apres-tirage-au-sort','collectif',1,'kit-peche');
call create_game_participation('mathieu-2021','jaune-2021','massacre-avec-massue-2021','participant','collectif',1,'kit-peche');
call create_game_participation('lucie-2021','jaune-2021','massacre-avec-massue-2021','participant','collectif',1,'kit-peche');

call create_game('les-armes-secretes','Equilibriste','equilibriste-2021','equilibriste','collectif','immunite',8,11,'','force,equilibre');

call create_game_participation('candice-2021','rouge-2021','equilibriste-2021','participant','collectif',2,'');
call create_game_participation('herve-2021','rouge-2021','equilibriste-2021','participant','collectif',2,'');
call create_game_participation('jonathan-2021','rouge-2021','equilibriste-2021','participant','collectif',2,'');
call create_game_participation('frederic-2021','rouge-2021','equilibriste-2021','exempte-sur-raison-medicale','collectif',2,'');
call create_game_participation('maxine-2021','rouge-2021','equilibriste-2021','participant','collectif',2,'');
call create_game_participation('gabin-2021','rouge-2021','equilibriste-2021','participant','collectif',2,'');
call create_game_participation('magali-2021','rouge-2021','equilibriste-2021','participant','collectif',2,'');
call create_game_participation('arnaud-2021','rouge-2021','equilibriste-2021','participant','collectif',2,'');
call create_game_participation('laure-2021','rouge-2021','equilibriste-2021','participant','collectif',2,'');

call create_game_participation('aurelien-2021','jaune-2021','equilibriste-2021','participant','collectif',1,'totem');
call create_game_participation('laetitia-2021','jaune-2021','equilibriste-2021','participant','collectif',1,'totem');
call create_game_participation('thomas-2021','jaune-2021','equilibriste-2021','participant','collectif',1,'totem');
call create_game_participation('myriam-2021','jaune-2021','equilibriste-2021','participant','collectif',1,'totem');
call create_game_participation('vincent-2021','jaune-2021','equilibriste-2021','exempte-par-choix','collectif',1,'totem');
call create_game_participation('flavio-2021','jaune-2021','equilibriste-2021','participant','collectif',1,'totem');
call create_game_participation('shanice-2021','jaune-2021','equilibriste-2021','participant','collectif',1,'totem');
call create_game_participation('mathieu-2021','jaune-2021','equilibriste-2021','participant','collectif',1,'totem');
call create_game_participation('lucie-2021','jaune-2021','equilibriste-2021','participant','collectif',1,'totem');

--
call first_vote_against ('les-armes-secretes','magali-2021','candice-2021','rouge-2021', 12, 'effectif');
call first_vote_against ('les-armes-secretes','frederic-2021','magali-2021','rouge-2021', 12, 'effectif');
call first_vote_against ('les-armes-secretes','candice-2021','magali-2021','rouge-2021', 12, 'effectif');
call first_vote_against ('les-armes-secretes','herve-2021','magali-2021','rouge-2021', 12, 'effectif');
call first_vote_against ('les-armes-secretes','laure-2021','candice-2021','rouge-2021', 12, 'effectif');
call first_vote_against ('les-armes-secretes','gabin-2021','candice-2021','rouge-2021', 12, 'effectif');
call first_vote_against ('les-armes-secretes','maxine-2021','candice-2021','rouge-2021', 12, 'effectif');
call first_vote_against ('les-armes-secretes','arnaud-2021','candice-2021','rouge-2021', 12, 'effectif');
call first_vote_against ('les-armes-secretes','jonathan-2021','magali-2021','rouge-2021', 12, 'effectif');


--

call create_participant_departure('les-armes-secretes','candice-2021','rouge-2021',12,'exclusion-par-vote', @participant_team_id);

-- realisation

call create_participant_realisation('les-armes-secretes','candice-2021','rouge-2021',11,'decouverte-collier-immunite',@realisation_id);
call create_participant_realisation('les-armes-secretes','vincent-2021','jaune-2021',12,'decouverte-arme-secrete',@realisation_id);
