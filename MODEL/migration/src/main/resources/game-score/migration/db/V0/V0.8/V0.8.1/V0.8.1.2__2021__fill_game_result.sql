-- parcours-feu 
call create_game('les-armes-secretes','Parcours feu','parcours-feu-2021','parcours-feu','collectif','selection-initiale',1,1,'vote-contre-soi','parcours,coordination,rapidite');

call create_game_participation('candice-2021','arrivee-2021','parcours-feu-2021','participant','binome',1,'chef-equipe,talisman');
call create_game_participation('herve-2021','arrivee-2021','parcours-feu-2021','participant','binome',1,'chef-equipe,talisman');

call create_game_participation('aurelien-2021','arrivee-2021','parcours-feu-2021','participant','binome',2,'chef-equipe,talisman');
call create_game_participation('laetitia-2021','arrivee-2021','parcours-feu-2021','participant','binome',2,'chef-equipe,talisman');

call create_game_participation('jonathan-2021','arrivee-2021','parcours-feu-2021','participant','binome',3,'');
call create_game_participation('laure-2021','arrivee-2021','parcours-feu-2021','participant','binome',3,'');

call create_game_participation('magali-2021','arrivee-2021','parcours-feu-2021','participant','binome',4,'');
call create_game_participation('flavio-2021','arrivee-2021','parcours-feu-2021','participant','binome',4,'');

call create_game_participation('vincent-2021','arrivee-2021','parcours-feu-2021','participant','binome',5,'');
call create_game_participation('marie-2021','arrivee-2021','parcours-feu-2021','participant','binome',5,'');

call create_game_participation('sylviane-2021','arrivee-2021','parcours-feu-2021','participant','binome',6,'');
call create_game_participation('arnaud-2021','arrivee-2021','parcours-feu-2021','participant','binome',6,'');

call create_game_participation('gabin-2021','arrivee-2021','parcours-feu-2021','participant','binome',7,'');
call create_game_participation('maxine-2021','arrivee-2021','parcours-feu-2021','participant','binome',7,'');

call create_game_participation('thomas-2021','arrivee-2021','parcours-feu-2021','participant','binome',8,'');
call create_game_participation('myriam-2021','arrivee-2021','parcours-feu-2021','participant','binome',8,'');

call create_game_participation('frederic-2021','arrivee-2021','parcours-feu-2021','participant','binome',10,'');
call create_game_participation('elodie-2021','arrivee-2021','parcours-feu-2021','participant','binome',10,'');

call create_game_participation('shanice-2021','arrivee-2021','parcours-feu-2021','participant','binome',10,'');
call create_game_participation('mathieu-2021','arrivee-2021','parcours-feu-2021','participant','binome',10,'');

--
/*
team 
rouge : candice, hervé marie jonathan gabin frederic maxine magali arnaud laure

jaune : aurelien, laetitia, thomas, myriam vincent flavio shanice mathieu sylviane elodie
--
jeu : equilibre-entre-platforme jour 2
-- 
*/
call create_game('les-armes-secretes','Equilibre entre plateformes','equilibre-entre-plateformes-2021','equilibre-entre-plateformes','collectif','immunite',2,2,null,'equilibre,coordination');

call create_game_participation('candice-2021','rouge-2021','equilibre-entre-plateformes-2021','participant','collectif',1,'totem');
call create_game_participation('herve-2021','rouge-2021','equilibre-entre-plateformes-2021','participant','collectif',1,'totem');
call create_game_participation('marie-2021','rouge-2021','equilibre-entre-plateformes-2021','participant','collectif',1,'totem');
call create_game_participation('jonathan-2021','rouge-2021','equilibre-entre-plateformes-2021','participant','collectif',1,'totem');
call create_game_participation('frederic-2021','rouge-2021','equilibre-entre-plateformes-2021','participant','collectif',1,'totem');
call create_game_participation('maxine-2021','rouge-2021','equilibre-entre-plateformes-2021','participant','collectif',1,'totem');
call create_game_participation('gabin-2021','rouge-2021','equilibre-entre-plateformes-2021','participant','collectif',1,'totem');
call create_game_participation('magali-2021','rouge-2021','equilibre-entre-plateformes-2021','participant','collectif',1,'totem');
call create_game_participation('arnaud-2021','rouge-2021','equilibre-entre-plateformes-2021','participant','collectif',1,'totem');
call create_game_participation('laure-2021','rouge-2021','equilibre-entre-plateformes-2021','participant','collectif',1,'totem');

call create_game_participation('aurelien-2021','jaune-2021','equilibre-entre-plateformes-2021','participant','collectif',2,'');
call create_game_participation('laetitia-2021','jaune-2021','equilibre-entre-plateformes-2021','participant','collectif',2,'');
call create_game_participation('thomas-2021','jaune-2021','equilibre-entre-plateformes-2021','participant','collectif',2,'');
call create_game_participation('myriam-2021','jaune-2021','equilibre-entre-plateformes-2021','participant','collectif',2,'');
call create_game_participation('vincent-2021','jaune-2021','equilibre-entre-plateformes-2021','participant','collectif',2,'');
call create_game_participation('flavio-2021','jaune-2021','equilibre-entre-plateformes-2021','participant','collectif',2,'');
call create_game_participation('shanice-2021','jaune-2021','equilibre-entre-plateformes-2021','participant','collectif',2,'');
call create_game_participation('mathieu-2021','jaune-2021','equilibre-entre-plateformes-2021','participant','collectif',2,'');
call create_game_participation('sylviane-2021','jaune-2021','equilibre-entre-plateformes-2021','participant','collectif',2,'');
call create_game_participation('elodie-2021','jaune-2021','equilibre-entre-plateformes-2021','participant','collectif',2,'');

/*
vote sylviane 
myriam, vincent, shanice, mathieu, aurelien
*/

call create_game('les-armes-secretes','Navigation en radeaux','navigation-en-radeaux-2021','radeaux','collectif','confort',3,4,'nourriture-poisson,renfort','force,construction,coordination');

call create_game_participation('candice-2021','rouge-2021','navigation-en-radeaux-2021','participant','collectif',2,'');
call create_game_participation('herve-2021','rouge-2021','navigation-en-radeaux-2021','participant','collectif',2,'');
call create_game_participation('marie-2021','rouge-2021','navigation-en-radeaux-2021','participant','collectif',2,'');
call create_game_participation('jonathan-2021','rouge-2021','navigation-en-radeaux-2021','participant','collectif',2,'');
call create_game_participation('frederic-2021','rouge-2021','navigation-en-radeaux-2021','participant','collectif',2,'');
call create_game_participation('maxine-2021','rouge-2021','navigation-en-radeaux-2021','participant','collectif',2,'');
call create_game_participation('gabin-2021','rouge-2021','navigation-en-radeaux-2021','participant','collectif',2,'');
call create_game_participation('magali-2021','rouge-2021','navigation-en-radeaux-2021','participant','collectif',2,'');
call create_game_participation('arnaud-2021','rouge-2021','navigation-en-radeaux-2021','participant','collectif',2,'');
call create_game_participation('laure-2021','rouge-2021','navigation-en-radeaux-2021','exclusion-apres-tirage-au-sort','collectif',2,'');

call create_game_participation('aurelien-2021','jaune-2021','navigation-en-radeaux-2021','participant','collectif',1,'nourriture-poisson,renfort');
call create_game_participation('laetitia-2021','jaune-2021','navigation-en-radeaux-2021','participant','collectif',1,'nourriture-poisson,renfort');
call create_game_participation('thomas-2021','jaune-2021','navigation-en-radeaux-2021','participant','collectif',1,'nourriture-poisson,renfort');
call create_game_participation('myriam-2021','jaune-2021','navigation-en-radeaux-2021','participant','collectif',1,'nourriture-poisson,renfort');
call create_game_participation('vincent-2021','jaune-2021','navigation-en-radeaux-2021','participant','collectif',1,'nourriture-poisson,renfort');
call create_game_participation('flavio-2021','jaune-2021','navigation-en-radeaux-2021','participant','collectif',1,'nourriture-poisson,renfort');
call create_game_participation('shanice-2021','jaune-2021','navigation-en-radeaux-2021','participant','collectif',1,'nourriture-poisson,renfort');
call create_game_participation('mathieu-2021','jaune-2021','navigation-en-radeaux-2021','participant','collectif',1,'nourriture-poisson,renfort');
call create_game_participation('elodie-2021','jaune-2021','navigation-en-radeaux-2021','participant','collectif',1,'nourriture-poisson,renfort');
-- victoire jaune

-- construction puzzle (immunite
call create_game('les-armes-secretes','Puzzle en lattes','puzzle-en-lattes-2021','parcours-puzzle','collectif','immunite',4,6,null,'logique,puzzle,parcours');

call create_game_participation('candice-2021','rouge-2021','puzzle-en-lattes-2021','participant','collectif',2,'');
call create_game_participation('herve-2021','rouge-2021','puzzle-en-lattes-2021','participant','collectif',2,'');
call create_game_participation('marie-2021','rouge-2021','puzzle-en-lattes-2021','participant','collectif',2,'');
call create_game_participation('jonathan-2021','rouge-2021','puzzle-en-lattes-2021','participant','collectif',2,'');
call create_game_participation('frederic-2021','rouge-2021','puzzle-en-lattes-2021','participant','collectif',2,'');
call create_game_participation('maxine-2021','rouge-2021','puzzle-en-lattes-2021','exclusion-apres-tirage-au-sort','collectif',2,'');
call create_game_participation('gabin-2021','rouge-2021','puzzle-en-lattes-2021','participant','collectif',2,'');
call create_game_participation('magali-2021','rouge-2021','puzzle-en-lattes-2021','participant','collectif',2,'');
call create_game_participation('arnaud-2021','rouge-2021','puzzle-en-lattes-2021','participant','collectif',2,'');
call create_game_participation('laure-2021','rouge-2021','puzzle-en-lattes-2021','participant','collectif',2,'');

call create_game_participation('aurelien-2021','jaune-2021','puzzle-en-lattes-2021','participant','collectif',1,'totem');
call create_game_participation('laetitia-2021','jaune-2021','puzzle-en-lattes-2021','participant','collectif',1,'totem');
call create_game_participation('thomas-2021','jaune-2021','puzzle-en-lattes-2021','participant','collectif',1,'totem');
call create_game_participation('myriam-2021','jaune-2021','puzzle-en-lattes-2021','participant','collectif',1,'totem');
call create_game_participation('vincent-2021','jaune-2021','puzzle-en-lattes-2021','participant','collectif',1,'totem');
call create_game_participation('flavio-2021','jaune-2021','puzzle-en-lattes-2021','participant','collectif',1,'totem');
call create_game_participation('shanice-2021','jaune-2021','puzzle-en-lattes-2021','participant','collectif',1,'totem');
call create_game_participation('mathieu-2021','jaune-2021','puzzle-en-lattes-2021','participant','collectif',1,'totem');
-- call create_game_participation('sylviane-2021','jaune-2021','puzzle-en-lattes-2021','participant','collectif',1,'totem');
call create_game_participation('elodie-2021','jaune-2021','puzzle-en-lattes-2021','participant','collectif',1,'totem');

-- arnaud trouve un collier d'immunité
-- magali trouve une arme secrète et défie marie en portance de batonnet au conseil
-- victoire jaune départ marie après defi

-- magali arme secrete : défi

-- marie vs magali duel (piece de bois  en pression)
-- marie vote contre

-- magali vote marie
-- marie vote fred
-- fred vote marie
-- candice vote arnaud
-- herve vote marie
-- laure vote fred
-- gabin vote marie
-- maxine vote arnaud
-- arnaud vote marie


call create_game('les-armes-secretes','Fugitif','fugitif-2021','fugitif','collectif','confort',5,7,'excursion-chez-l-habitant','strategie,force,rapidite');

call create_game_participation('candice-2021','rouge-2021','fugitif-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('herve-2021','rouge-2021','fugitif-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('jonathan-2021','rouge-2021','fugitif-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('frederic-2021','rouge-2021','fugitif-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('maxine-2021','rouge-2021','fugitif-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('gabin-2021','rouge-2021','fugitif-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('magali-2021','rouge-2021','fugitif-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('arnaud-2021','rouge-2021','fugitif-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('laure-2021','rouge-2021','fugitif-2021','participant','collectif',1,'excursion-chez-l-habitant');

call create_game_participation('aurelien-2021','jaune-2021','fugitif-2021','participant','collectif',2,'');
call create_game_participation('laetitia-2021','jaune-2021','fugitif-2021','participant','collectif',2,'');
call create_game_participation('thomas-2021','jaune-2021','fugitif-2021','participant','collectif',2,'');
call create_game_participation('myriam-2021','jaune-2021','fugitif-2021','participant','collectif',2,'');
call create_game_participation('vincent-2021','jaune-2021','fugitif-2021','participant','collectif',2,'');
call create_game_participation('flavio-2021','jaune-2021','fugitif-2021','participant','collectif',2,'');
call create_game_participation('shanice-2021','jaune-2021','fugitif-2021','exclusion-apres-tirage-au-sort','collectif',2,'');
call create_game_participation('mathieu-2021','jaune-2021','fugitif-2021','participant','collectif',2,'');
call create_game_participation('lucie-2021','jaune-2021','fugitif-2021','participant','collectif',2,'');
call create_game_participation('elodie-2021','jaune-2021','fugitif-2021','participant','collectif',2,'');

call create_game('les-armes-secretes','Flambeaux','flambeaux-2021','flambeaux','collectif','immunite',6,8,'','apnee,force,rapidite');


call create_game_participation('candice-2021','rouge-2021','flambeaux-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('herve-2021','rouge-2021','flambeaux-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('jonathan-2021','rouge-2021','flambeaux-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('frederic-2021','rouge-2021','flambeaux-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('maxine-2021','rouge-2021','flambeaux-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('gabin-2021','rouge-2021','flambeaux-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('magali-2021','rouge-2021','flambeaux-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('arnaud-2021','rouge-2021','flambeaux-2021','participant','collectif',1,'excursion-chez-l-habitant');
call create_game_participation('laure-2021','rouge-2021','flambeaux-2021','participant','collectif',1,'excursion-chez-l-habitant');

call create_game_participation('aurelien-2021','jaune-2021','flambeaux-2021','participant','collectif',2,'');
call create_game_participation('laetitia-2021','jaune-2021','flambeaux-2021','participant','collectif',2,'');
call create_game_participation('thomas-2021','jaune-2021','flambeaux-2021','participant','collectif',2,'');
call create_game_participation('myriam-2021','jaune-2021','flambeaux-2021','participant','collectif',2,'');
call create_game_participation('vincent-2021','jaune-2021','flambeaux-2021','participant','collectif',2,'');
call create_game_participation('flavio-2021','jaune-2021','flambeaux-2021','participant','collectif',2,'');
call create_game_participation('shanice-2021','jaune-2021','flambeaux-2021','exclusion-apres-tirage-au-sort','collectif',2,'');
call create_game_participation('mathieu-2021','jaune-2021','flambeaux-2021','participant','collectif',2,'');
call create_game_participation('lucie-2021','jaune-2021','flambeaux-2021','participant','collectif',2,'');
call create_game_participation('elodie-2021','jaune-2021','flambeaux-2021','participant','collectif',2,'');

-- vote 9eme jour
/*
aurelien > elodie
laetitia > elodie
thomas > elodie
myriam > elodie
vincent > elodie
flavio > elodie
shanice > lucie
mathieu > laetitia
lucie > laetitia
elodie > laetitia

*/

