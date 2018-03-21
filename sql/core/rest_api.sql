--
-- Table structure for table `api_access`
--

DROP TABLE IF EXISTS `api_access`;
CREATE TABLE IF NOT EXISTS `api_access` (
       `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
       `key` VARCHAR(40) NOT NULL DEFAULT '',
       `all_access` TINYINT(1) NOT NULL DEFAULT '0',
       `controller` VARCHAR(50) NOT NULL DEFAULT '',
       `date_created` DATETIME DEFAULT NULL,
       `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
       PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
CREATE TABLE IF NOT EXISTS `api_keys` (
       `id` INT(11) NOT NULL AUTO_INCREMENT,
       `user_id` INT(11) NOT NULL,
       `key` VARCHAR(40) NOT NULL,
       `level` INT(2) NOT NULL,
       `ignore_limits` TINYINT(1) NOT NULL DEFAULT '0',
       `is_private_key` TINYINT(1)  NOT NULL DEFAULT '0',
       `ip_addresses` TEXT NULL DEFAULT NULL,
       `date_created` INT(11) NOT NULL,
       PRIMARY KEY (`id`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `api_limits`
--

DROP TABLE IF EXISTS `api_limits`;
CREATE TABLE IF NOT EXISTS `api_limits` (
       `id` INT(11) NOT NULL AUTO_INCREMENT,
       `uri` VARCHAR(255) NOT NULL,
       `count` INT(10) NOT NULL,
       `hour_started` INT(11) NOT NULL,
       `api_key` VARCHAR(40) NOT NULL,
       PRIMARY KEY (`id`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------

--
-- Table structure for table `api_logs`
--

DROP TABLE IF EXISTS `api_logs`;
CREATE TABLE IF NOT EXISTS `api_logs` (
       `id` INT(11) NOT NULL AUTO_INCREMENT,
       `uri` VARCHAR(255) NOT NULL,
       `method` VARCHAR(6) NOT NULL,
       `params` TEXT DEFAULT NULL,
       `api_key` VARCHAR(40) NOT NULL,
       `ip_address` VARCHAR(45) NOT NULL,
       `time` INT(11) NOT NULL,
       `rtime` FLOAT DEFAULT NULL,
       `authorized` VARCHAR(1) NOT NULL,
       `response_code` smallint(3) DEFAULT '0',
       PRIMARY KEY (`id`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------