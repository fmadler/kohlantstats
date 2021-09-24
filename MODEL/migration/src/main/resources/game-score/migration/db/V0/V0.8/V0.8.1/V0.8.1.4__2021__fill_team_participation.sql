call create_participant_entrance ('les-armes-secretes','candice-2021','rouge-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','herve-2021','rouge-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','marie-2021','rouge-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','jonathan-2021','rouge-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','frederic-2021','rouge-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','maxine-2021','rouge-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','gabin-2021','rouge-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','magali-2021','rouge-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','arnaud-2021','rouge-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','laure-2021','rouge-2021',1,'constitution-des-equipes', @participant_team_id);

call create_participant_entrance ('les-armes-secretes','aurelien-2021','jaune-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','laetitia-2021','jaune-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','thomas-2021','jaune-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','myriam-2021','jaune-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','vincent-2021','jaune-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','flavio-2021','jaune-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','shanice-2021','jaune-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','mathieu-2021','jaune-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','sylviane-2021','jaune-2021',1,'constitution-des-equipes', @participant_team_id);
call create_participant_entrance ('les-armes-secretes','elodie-2021','jaune-2021',1,'constitution-des-equipes', @participant_team_id);

call create_participant_entrance ('les-armes-secretes','lucie-2021','jaune-2021',4,'renfort-equipe', @participant_team_id);

call create_participant_departure ('les-armes-secretes','sylviane-2021','jaune-2021',3,'exclusion-par-vote', @participant_team_id);
call create_participant_departure ('les-armes-secretes','marie-2021','rouge-2021',6,'exclusion-par-vote', @participant_team_id);
call create_participant_departure ('les-armes-secretes','elodie-2021','jaune-2021',9,'exclusion-par-vote', @participant_team_id);


-- realisation

call create_participant_realisation('les-armes-secretes','arnaud-2021','rouge-2021',5,'decouverte-collier-immunite',@realisation_id);
call create_participant_realisation('les-armes-secretes','magali-2021','rouge-2021',5,'decouverte-arme-secrete',@realisation_id);
