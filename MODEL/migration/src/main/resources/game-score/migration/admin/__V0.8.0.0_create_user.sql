
CREATE SCHEMA IF NOT EXISTS `kohlantstats` DEFAULT CHARACTER SET utf8 ;

CREATE USER 'kls_crud'@'%' IDENTIFIED BY 'K!_user$crud1_mp';

GRANT ALL PRIVILEGES ON kohlantstats.* TO 'kls_crud'@'%';
