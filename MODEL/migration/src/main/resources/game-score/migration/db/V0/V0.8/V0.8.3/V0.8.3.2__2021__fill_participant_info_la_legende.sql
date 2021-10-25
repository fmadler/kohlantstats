INSERT INTO `GS_LOCATION` (`PLACE`, `PLACE_WEB_PATH`, `COUNTRY`, `COUNTRY_WEB_PATH`, `COUNTRY_FLAG`) VALUES ('Thailande', 'thailande', 'Thailande', 'thailande', 'Thailande.png');
INSERT INTO `GS_LOCATION` (`PLACE`, `PLACE_WEB_PATH`, `COUNTRY`, `COUNTRY_WEB_PATH`, `COUNTRY_FLAG`) VALUES ('Malaisie', 'malaisie', 'Malaisie', 'malaisie', 'Malaisie.png');
INSERT INTO `GS_LOCATION` (`PLACE`, `PLACE_WEB_PATH`, `COUNTRY`, `COUNTRY_WEB_PATH`, `COUNTRY_FLAG`) VALUES ('Cambodge', 'cambodge', 'Cambodge', 'cambodge', 'Cambodge.png');


call create_programme('La légende', 'la-legende-2021', '2021', 22, 36, 'polynesie-francaise', 'Polynésie Française', 1);
call create_programme('Palawan', 'palawan-2021', '2007', 6, 40, 'thailande', 'Thailande', 0);
call create_programme('Le choc des héros', 'le-choc-des-heros-2010', '2010', 9, 40, 'thailande', 'Thailande', 0);
call create_programme('La nouvelle édition', 'la-nouvelle-edition-2014', '2014', 13, 40, 'malaisie', 'Malaisie', 0);
call create_programme('Cambodge', 'cambodge-2017', '2017', 6, 40, 'cambodge', 'Cambodge', 0);
call create_programme('Malaisie', 'mailaisie-2012', '2012', 11, 40, 'malaisie', 'Malaisie', 0); 
call create_programme('L''ïle au trésor', 'l-ile-au-tresor-2016', '2016', 17, 40, 'malaisie', 'Malaisie', 0); 
call create_programme('La guerre des chefs', 'la-guerre-des-chefs-2019', '2019', 19, 40, 'malaisie', 'Malaisie', 0); 

call add_participant('la-legende-2021', 'Claude', 'Dartois', 'claude-2010', 'M', 42, null, 0, '', '');
-- Dartois

call add_participant('la-legende-2021', 'Coumba', '', 'coumba-2010', 'F', 39, null, 0, '', '');
-- Baradji

call add_participant('la-legende-2021', 'Ugo', '', 'ugo-2012', 'M', 40, null, 0, '', '');
-- lartiche

call add_participant('la-legende-2021', 'Clemence', '', 'clemence-2005', 'F', 36, null, 0, '', '');
-- Castel

call add_participant('la-legende-2021', 'Jade', '', 'jade-2007', 'M', 39, null, 0, '', '');
-- Handi
call add_participant('la-legende-2021', 'Karima', '', 'karima-2016', 'F', 26, null, 17, '', 'Militaire');
-- Najjarine
call add_participant('la-legende-2021', 'Teheiura', '', 'teheiura-2011', 'F', 43, null, 0, '', '');
-- teahui
call add_participant('la-legende-2021', 'Patrick', '', 'patrick-2009', 'M', 51, null, 19, '', '');
-- Merle 
call add_participant('la-legende-2021', 'Alix', '', 'alix-2020', 'M', 28, null, 0, '', '');
-- Noblat
call add_participant('la-legende-2021', 'Alexandra', '', 'alexandra-2020', 'F', 25, null, 0, '', '');
-- pornet
call add_participant('la-legende-2021', 'Sam', '', 'sam-2018', 'F', 44, null, 0, '', '');
-- haliti
call add_participant('la-legende-2021', 'Christelle', '', 'christelle-2008', 'M', 41, null, 0, '', '');
-- Gauzet  
call add_participant('la-legende-2021', 'Candice', '', 'candice-2016', 'F', 24, null, 15, '', '');
-- Boisson 
call add_participant('la-legende-2021', 'Clémentine', '', 'clementine-2017', 'F', 29, null, 14, '', '');
-- jullien
call add_participant('la-legende-2021', 'Cindy', '', 'cindy-2019', 'F', 33, null, 19, '', '');
-- Poumeyrol 
call add_participant('la-legende-2021', 'Freddy', '', 'freddy-2010', 'M', 36, null, 20, '', '');
-- boucher
call add_participant('la-legende-2021', 'Laurent', '', 'laurent-2011', 'M', 39, null, 0, '', '');
call add_participant('la-legende-2021', 'Phil', '', 'phil-2012', 'M', null, null, 0, '', '');
-- bizet
call add_participant('la-legende-2021', 'Maxime', '', 'maxime-2019', 'M', 34, null, 16, '', '');
-- berthon
call add_participant('la-legende-2021', 'Namadia', '', 'namadia-2012', 'M', 38, null, 0, '', '');
-- berthon
/*
*/