call create_participant_entrance ('les-quatre-terres','bertrand-kamal-2020','blanc-2020',22,'reunification', @participant_team_id);
call create_participant_entrance ('les-quatre-terres','hadja-2020','blanc-2020',22,'reunification', @participant_team_id);
call create_participant_entrance ('les-quatre-terres','joaquina-2020','blanc-2020',22,'reunification', @participant_team_id);
call create_participant_entrance ('les-quatre-terres','brice-2020','blanc-2020',22,'reunification', @participant_team_id);
call create_participant_entrance ('les-quatre-terres','ava-2020','blanc-2020',22,'reunification', @participant_team_id);
call create_participant_entrance ('les-quatre-terres','fabrice-2020','blanc-2020',22,'reunification', @participant_team_id);
call create_participant_entrance ('les-quatre-terres','marie-france-2020','blanc-2020',22,'reunification', @participant_team_id);
call create_participant_entrance ('les-quatre-terres','alix-2020','blanc-2020',22,'reunification', @participant_team_id);
call create_participant_entrance ('les-quatre-terres','jody-2020','blanc-2020',22,'reunification', @participant_team_id);
call create_participant_entrance ('les-quatre-terres','loic-2020','blanc-2020',22,'reunification', @participant_team_id);
call create_participant_entrance ('les-quatre-terres','laurent-2020','blanc-2020',22,'reunification', @participant_team_id);
call create_participant_entrance ('les-quatre-terres','angelique-2020','blanc-2020',22,'reunification', @participant_team_id);
call create_participant_entrance ('les-quatre-terres','lola-2020','blanc-2020',22,'reunification', @participant_team_id);
call create_participant_entrance ('les-quatre-terres','alexandra-2020','blanc-2020',22,'reunification', @participant_team_id);
call create_participant_entrance ('les-quatre-terres','dorian-2020','blanc-2020',22,'reunification', @participant_team_id);

call create_participant_departure ('les-quatre-terres',	'hadja-2020','blanc-2020',23,'exclusion-par-vote', @participant_team_id);
call create_participant_departure ('les-quatre-terres',	'bertrand-kamal-2020','blanc-2020',24,'elimination-du-dernier', @participant_team_id);
call create_participant_departure ('les-quatre-terres',	'joaquina-2020','blanc-2020',25,'exclusion-par-vote', @participant_team_id);
call create_participant_departure ('les-quatre-terres',	'jody-2020','blanc-2020',29,'exclusion-par-vote', @participant_team_id);

call create_participant_departure ('les-quatre-terres',	'alix-2020','blanc-2020',32,'exclusion-par-vote', @participant_team_id);
call create_participant_departure ('les-quatre-terres',	'laurent-2020','blanc-2020',32,'exclusion-par-vote', @participant_team_id);
call create_participant_departure ('les-quatre-terres',	'fabrice-2020','blanc-2020',35,'elimination-du-dernier', @participant_team_id);

call create_participant_departure ('les-quatre-terres',	'ava-2020','blanc-2020',35,'exclusion-par-vote', @participant_team_id);
call create_participant_departure ('les-quatre-terres',	'angelique-2020','blanc-2020',37,'exclusion-par-vote', @participant_team_id);

call create_participant_departure ('les-quatre-terres',	'dorian-2020','blanc-2020',39,'defaite-orientation', @participant_team_id);
call create_participant_departure ('les-quatre-terres',	'lola-2020','blanc-2020',39,'defaite-orientation', @participant_team_id);

call create_participant_departure ('les-quatre-terres',	'loic-2020','blanc-2020',40,'epreuve-poteaux', @participant_team_id);

call create_participant_departure ('les-quatre-terres',	'alexandra-2020','blanc-2020',40,'epreuve-poteaux', @participant_team_id);
call create_participant_departure ('les-quatre-terres',	'brice-2020','blanc-2020',40,'epreuve-poteaux', @participant_team_id);

call create_participant_realisation ('les-quatre-terres','jody-2020','blanc-2020',27,'chercher-le-courrier',@realisation_id);
call create_participant_realisation ('les-quatre-terres','dorian-2020','blanc-2020',27,'chercher-le-courrier',@realisation_id);

call create_participant_realisation ('les-quatre-terres','lola-2020','nord-2020',10,'decouverte-collier-immunite',@realisation_id);
call create_participant_realisation ('les-quatre-terres','lola-2020','jaune-2020',20,'decouverte-collier-immunite',@realisation_id);
call create_participant_realisation ('les-quatre-terres','estelle-2020','ouest-2020',6,'decouverte-collier-immunite',@realisation_id);
call create_participant_realisation ('les-quatre-terres','aubin-2020','sud-2020',8,'decouverte-collier-immunite',@realisation_id);
call create_participant_realisation ('les-quatre-terres','alix-2020','sud-2020',20,'gagner-collier-immunite',@realisation_id);

call create_participant_realisation ('les-quatre-terres','mathieu-2020','sud-2020',1,'allumage-du-feu',@realisation_id);

-- add collier de lola
-- collier d'estelle
-- collier d'alix

