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

call add_participant('la-legende-2021', 'Claude', '42', 'claude-2010', 'M', null, null, 0, '', '');
-- Dartois

call add_participant('la-legende-2021', 'Coumba', '39', 'coumba-2010', 'F', null, null, 0, '', '');
-- Baradji

call add_participant('la-legende-2021', 'Ugo', '40', 'ugo-2012', 'M', null, null, 0, '', '');
-- lartiche

call add_participant('la-legende-2021', 'Clemence', '36', 'clemence-2005', 'F', null, null, 0, '', '');
-- Castel

call add_participant('la-legende-2021', 'Jade', '39', 'jade-2007', 'M', null, null, 0, '', '');
-- Handi
call add_participant('la-legende-2021', 'Karima', '26', 'karima-2016', 'F', null, null, 17, '', 'Militaire');
-- Najjarine
call add_participant('la-legende-2021', 'Teheiura', '43', 'teheiura-2011', 'F', null, null, 0, '', '');
-- teahui
call add_participant('la-legende-2021', 'Patrick', '51', 'patrick-2009', 'M', null, null, 19, '', '');
-- Merle 
call add_participant('la-legende-2021', 'Alix', '28', 'alix-2020', 'M', null, null, 0, '', '');
-- Noblat
call add_participant('la-legende-2021', 'Alexandra', '25', 'alexandra-2020', 'F', null, null, 0, '', '');
-- pornet
call add_participant('la-legende-2021', 'Sam', '44', 'sam-2018', 'F', null, null, 0, '', '');
-- haliti
call add_participant('la-legende-2021', 'Christelle', '41', 'christelle-2008', 'M', null, null, 0, '', '');
-- Gauzet  
call add_participant('la-legende-2021', 'Candice', '24', 'candice-2016', 'F', null, null, 0, '', '');
-- Boisson 
call add_participant('la-legende-2021', 'Clémentine', '29', 'clementine-2017', 'F', null, null, 0, '', '');
-- jullien
call add_participant('la-legende-2021', 'Cindy', '33', 'cindy-2019', 'F', null, null, 19, '', '');
-- Poumeyrol 
call add_participant('la-legende-2021', 'Freddy', '36', 'freddy-2010', 'M', null, null, 20, '', '');
-- boucher
call add_participant('la-legende-2021', 'Laurent', '39', 'laurent-2011', 'F', null, null, 0, '', '');
call add_participant('la-legende-2021', 'Phil', '26', 'phil-2012', 'F', null, null, 0, '', '');
-- bizet
call add_participant('la-legende-2021', 'Maxime', '34', 'maxime-2019', 'M', null, null, 0, '', '');
-- berthon
call add_participant('la-legende-2021', 'Namadia', '38', 'namadia-2012', 'M', null, null, 0, '', 'Elageur');
-- berthon
/*
*/