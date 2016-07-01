-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 01-Jul-2016 às 02:31
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `humhub`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(100) NOT NULL,
  `module` varchar(100) DEFAULT '',
  `object_model` varchar(100) DEFAULT '',
  `object_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Extraindo dados da tabela `activity`
--

INSERT INTO `activity` (`id`, `class`, `module`, `object_model`, `object_id`) VALUES
(1, 'humhub\\modules\\space\\activities\\Created', 'space', 'humhub\\modules\\space\\models\\Space', 1),
(2, 'humhub\\modules\\content\\activities\\ContentCreated', 'content', 'humhub\\modules\\post\\models\\Post', 1),
(3, 'humhub\\modules\\space\\activities\\MemberAdded', 'space', 'humhub\\modules\\space\\models\\Space', 1),
(4, 'humhub\\modules\\space\\activities\\MemberAdded', 'space', 'humhub\\modules\\space\\models\\Space', 1),
(5, 'humhub\\modules\\content\\activities\\ContentCreated', 'content', 'humhub\\modules\\post\\models\\Post', 2),
(6, 'humhub\\modules\\comment\\activities\\NewComment', 'comment', 'humhub\\modules\\comment\\models\\Comment', 1),
(7, 'humhub\\modules\\comment\\activities\\NewComment', 'comment', 'humhub\\modules\\comment\\models\\Comment', 2),
(8, 'humhub\\modules\\like\\activities\\Liked', 'like', 'humhub\\modules\\like\\models\\Like', 1),
(9, 'humhub\\modules\\content\\activities\\ContentCreated', 'content', 'humhub\\modules\\polls\\models\\Poll', 1),
(10, 'humhub\\modules\\polls\\activities\\NewVote', 'polls', 'humhub\\modules\\polls\\models\\Poll', 1),
(11, 'humhub\\modules\\comment\\activities\\NewComment', 'comment', 'humhub\\modules\\comment\\models\\Comment', 3),
(12, 'humhub\\modules\\polls\\activities\\NewVote', 'polls', 'humhub\\modules\\polls\\models\\Poll', 1),
(13, 'humhub\\modules\\comment\\activities\\NewComment', 'comment', 'humhub\\modules\\comment\\models\\Comment', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cfiles_file`
--

CREATE TABLE IF NOT EXISTS `cfiles_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_folder_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cfiles_folder`
--

CREATE TABLE IF NOT EXISTS `cfiles_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_folder_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `space_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `comment`
--

INSERT INTO `comment` (`id`, `message`, `object_model`, `object_id`, `space_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Nike – Just buy it. ;Wink;', 'humhub\\modules\\post\\models\\Post', 2, NULL, '2016-06-30 21:24:51', 2, '2016-06-30 21:24:51', 2),
(2, 'Calvin Klein – Between love and madness lies obsession.', 'humhub\\modules\\post\\models\\Post', 2, NULL, '2016-06-30 21:24:51', 3, '2016-06-30 21:24:51', 3),
(3, 'Why don''t we go to Bemelmans Bar?', 'humhub\\modules\\polls\\models\\Poll', 1, NULL, '2016-06-30 21:24:54', 2, '2016-06-30 21:24:54', 2),
(4, 'Again? ;Weary;', 'humhub\\modules\\polls\\models\\Poll', 1, NULL, '2016-06-30 21:24:54', 3, '2016-06-30 21:24:54', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `content`
--

CREATE TABLE IF NOT EXISTS `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) NOT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `sticked` tinyint(4) DEFAULT NULL,
  `archived` tinytext,
  `space_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_object_model` (`object_model`,`object_id`),
  UNIQUE KEY `index_guid` (`guid`),
  KEY `index_space_id` (`space_id`),
  KEY `index_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Extraindo dados da tabela `content`
--

INSERT INTO `content` (`id`, `guid`, `object_model`, `object_id`, `visibility`, `sticked`, `archived`, `space_id`, `user_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '64c3be10-f48b-49d7-8452-dc2b981e6e8c', 'humhub\\modules\\activity\\models\\Activity', 1, 1, 0, '0', 1, 1, '2016-06-30 21:24:29', 1, '2016-06-30 21:24:29', 1),
(2, 'ed3334c6-94ff-453c-8c76-1ca0ecb208ac', 'humhub\\modules\\post\\models\\Post', 1, 1, 0, '0', 1, 1, '2016-06-30 21:24:31', 1, '2016-06-30 21:24:31', 1),
(3, 'a294c3c0-b57b-4a50-937d-ed8cadcb5f1f', 'humhub\\modules\\activity\\models\\Activity', 2, 1, 0, '0', 1, 1, '2016-06-30 21:24:31', 1, '2016-06-30 21:24:31', 1),
(4, 'bebb1f5a-0a3a-45a0-b4a3-d9b4d1a9b699', 'humhub\\modules\\activity\\models\\Activity', 3, 0, 0, '0', 1, 2, '2016-06-30 21:24:47', 1, '2016-06-30 21:24:47', 1),
(5, '4bd7fedb-3210-401d-966e-07036c219e9a', 'humhub\\modules\\activity\\models\\Activity', 4, 0, 0, '0', 1, 3, '2016-06-30 21:24:49', 1, '2016-06-30 21:24:49', 1),
(6, '1de95389-2dd3-45cc-9846-261e9b95f4be', 'humhub\\modules\\post\\models\\Post', 2, 0, 0, '0', 1, 1, '2016-06-30 21:24:50', 1, '2016-06-30 21:24:50', 1),
(7, 'f447aa61-b25e-4ace-a4d4-c41bd0fd301b', 'humhub\\modules\\activity\\models\\Activity', 5, 0, 0, '0', 1, 1, '2016-06-30 21:24:50', 1, '2016-06-30 21:24:50', 1),
(8, '62136492-f3cb-48fb-98ad-af674a23eab5', 'humhub\\modules\\activity\\models\\Activity', 6, 0, 0, '0', 1, 2, '2016-06-30 21:24:51', 2, '2016-06-30 21:24:51', 2),
(9, '1b9380e1-b8e5-470f-911c-625f24f25288', 'humhub\\modules\\activity\\models\\Activity', 7, 0, 0, '0', 1, 3, '2016-06-30 21:24:51', 3, '2016-06-30 21:24:51', 3),
(10, '61fb9464-addd-4ca9-abe9-fce924d86ce3', 'humhub\\modules\\activity\\models\\Activity', 8, 0, 0, '0', 1, 3, '2016-06-30 21:24:52', 3, '2016-06-30 21:24:52', 3),
(11, 'a5391e07-8d6c-4747-8105-4d30507522ee', 'humhub\\modules\\polls\\models\\Poll', 1, 0, 0, '0', 1, 1, '2016-06-30 21:24:52', 1, '2016-06-30 21:24:52', 1),
(12, '67749a60-5527-408c-bd2e-0622f2772a50', 'humhub\\modules\\activity\\models\\Activity', 9, 0, 0, '0', 1, 1, '2016-06-30 21:24:52', 1, '2016-06-30 21:24:52', 1),
(13, '900f74ac-a48a-4993-8e42-b3ef87312df3', 'humhub\\modules\\activity\\models\\Activity', 10, 0, 0, '0', 1, 2, '2016-06-30 21:24:53', 2, '2016-06-30 21:24:53', 2),
(14, 'ca578d1d-1991-48e5-9616-5088a3a5204b', 'humhub\\modules\\activity\\models\\Activity', 11, 0, 0, '0', 1, 2, '2016-06-30 21:24:54', 2, '2016-06-30 21:24:54', 2),
(15, '5c22d684-baef-4cbf-a4e1-bb2134bc2a09', 'humhub\\modules\\activity\\models\\Activity', 12, 0, 0, '0', 1, 3, '2016-06-30 21:24:54', 3, '2016-06-30 21:24:54', 3),
(16, '1d9e7dc5-8752-4152-9870-fb63faa180b4', 'humhub\\modules\\activity\\models\\Activity', 13, 0, 0, '0', 1, 3, '2016-06-30 21:24:54', 3, '2016-06-30 21:24:54', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contentcontainer`
--

CREATE TABLE IF NOT EXISTS `contentcontainer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `pk` int(11) DEFAULT NULL,
  `owner_user_id` int(11) DEFAULT NULL,
  `wall_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_target` (`class`,`pk`),
  UNIQUE KEY `unique_guid` (`guid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `contentcontainer`
--

INSERT INTO `contentcontainer` (`id`, `guid`, `class`, `pk`, `owner_user_id`, `wall_id`) VALUES
(1, 'f3b9b107-161a-4b3a-ab64-597b8fb42e4e', 'humhub\\modules\\user\\models\\User', 1, 1, 1),
(2, '1ba420fb-c094-40ae-ad39-82a0386ce2d4', 'humhub\\modules\\space\\models\\Space', 1, 1, 2),
(3, 'f9d43c0b-de1a-47b4-a088-188ddb63a06b', 'humhub\\modules\\user\\models\\User', 2, 2, 3),
(4, 'ff169a1d-f48a-4326-8113-b390cce79d2c', 'humhub\\modules\\user\\models\\User', 3, 3, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contentcontainer_permission`
--

CREATE TABLE IF NOT EXISTS `contentcontainer_permission` (
  `permission_id` varchar(150) NOT NULL,
  `contentcontainer_id` int(11) NOT NULL DEFAULT '0',
  `group_id` varchar(50) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`,`contentcontainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `custom_pages_container_page`
--

CREATE TABLE IF NOT EXISTS `custom_pages_container_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `page_content` text,
  `type` smallint(6) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `in_new_window` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `custom_pages_page`
--

CREATE TABLE IF NOT EXISTS `custom_pages_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `content` text,
  `sort_order` int(11) DEFAULT NULL,
  `navigation_class` varchar(255) NOT NULL,
  `admin_only` tinyint(1) DEFAULT '0',
  `in_new_window` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `file`
--

CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `object_model` varchar(100) DEFAULT '',
  `object_id` varchar(100) DEFAULT '',
  `file_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `mime_type` varchar(150) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_object` (`object_model`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `space_id` int(10) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `group`
--

INSERT INTO `group` (`id`, `space_id`, `name`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `ldap_dn`) VALUES
(1, NULL, 'Users', 'Example Group by Installer', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `group_admin`
--

CREATE TABLE IF NOT EXISTS `group_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_admin` (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `group_permission`
--

CREATE TABLE IF NOT EXISTS `group_permission` (
  `permission_id` varchar(150) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `module_id` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `like`
--

CREATE TABLE IF NOT EXISTS `like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_user_id` int(11) DEFAULT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_object` (`object_model`,`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `like`
--

INSERT INTO `like` (`id`, `target_user_id`, `object_model`, `object_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, NULL, 'humhub\\modules\\comment\\models\\Comment', 1, '2016-06-30 21:24:52', 3, '2016-06-30 21:24:52', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `log`
--

INSERT INTO `log` (`id`, `level`, `category`, `log_time`, `prefix`, `message`) VALUES
(1, 2, 'yii\\validators\\FileValidator::getSizeLimit', 1467332801.7498, '[::1][1][-]', 'PHP.ini''s ''post_max_size'' is less than ''upload_max_filesize''.'),
(2, 2, 'yii\\validators\\FileValidator::getSizeLimit', 1467332801.7498, '[::1][1][-]', 'PHP.ini''s ''post_max_size'' is less than ''upload_max_filesize''.'),
(3, 4, 'application', 1467332801.4078, '[::1][1][-]', '$_GET = [\n    ''r'' => ''admin/setting/design''\n]\n\n$_SERVER = [\n    ''HTTP_HOST'' => ''localhost''\n    ''HTTP_CONNECTION'' => ''keep-alive''\n    ''HTTP_UPGRADE_INSECURE_REQUESTS'' => ''1''\n    ''HTTP_USER_AGENT'' => ''Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36''\n    ''HTTP_ACCEPT'' => ''text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8''\n    ''HTTP_REFERER'' => ''http://localhost/Intranet/humhub/index.php?r=admin%2Fsetting%2Fbasic''\n    ''HTTP_ACCEPT_ENCODING'' => ''gzip, deflate, sdch''\n    ''HTTP_ACCEPT_LANGUAGE'' => ''pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,gl;q=0.2''\n    ''HTTP_COOKIE'' => ''pm_share-panel=expanded; pm_new-people-panel=expanded; pm_new-spaces-panel=expanded; pm_getting-started-panel=expanded; language=bb6fe2b51b4703bab1e2b66084183764cd5d627a09c898ed4e59ae4de9fb924ba%3A2%3A%7Bi%3A0%3Bs%3A8%3A%22language%22%3Bi%3A1%3Bs%3A5%3A%22pt_br%22%3B%7D; _csrf=32a1d99e85fb31c3e7588060e9b9c6622ed9b2e63140d3abed0c7d710af7fda3a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22D0iVJzwFlyyBNan5lATen9yozpLhuLgx%22%3B%7D; PHPSESSID=h25vh32au5qpfdj7neho3aiv71''\n    ''PATH'' => ''C:\\\\ProgramData\\\\Oracle\\\\Java\\\\javapath;C:\\\\Windows\\\\system32;C:\\\\Windows;C:\\\\Windows\\\\System32\\\\Wbem;C:\\\\Windows\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\Program Files\\\\Intel\\\\WiFi\\\\bin\\\\;C:\\\\Program Files\\\\Common Files\\\\Intel\\\\WirelessCommon\\\\;C:\\\\Program Files\\\\nodejs\\\\;C:\\\\Users\\\\Dell\\\\Documents\\\\Projetos\\\\apache-ant-1.9.6\\\\bin;C:\\\\wamp\\\\bin\\\\php\\\\php5.5.12;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;''\n    ''SystemRoot'' => ''C:\\\\Windows''\n    ''COMSPEC'' => ''C:\\\\Windows\\\\system32\\\\cmd.exe''\n    ''PATHEXT'' => ''.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC''\n    ''WINDIR'' => ''C:\\\\Windows''\n    ''SERVER_SIGNATURE'' => ''<address>Apache/2.4.9 (Win64) PHP/5.5.12 Server at localhost Port 80</address>\n''\n    ''SERVER_SOFTWARE'' => ''Apache/2.4.9 (Win64) PHP/5.5.12''\n    ''SERVER_NAME'' => ''localhost''\n    ''SERVER_ADDR'' => ''::1''\n    ''SERVER_PORT'' => ''80''\n    ''REMOTE_ADDR'' => ''::1''\n    ''DOCUMENT_ROOT'' => ''C:/wamp/www/''\n    ''REQUEST_SCHEME'' => ''http''\n    ''CONTEXT_PREFIX'' => ''''\n    ''CONTEXT_DOCUMENT_ROOT'' => ''C:/wamp/www/''\n    ''SERVER_ADMIN'' => ''admin@example.com''\n    ''SCRIPT_FILENAME'' => ''C:/wamp/www/Intranet/humhub/index.php''\n    ''REMOTE_PORT'' => ''52989''\n    ''GATEWAY_INTERFACE'' => ''CGI/1.1''\n    ''SERVER_PROTOCOL'' => ''HTTP/1.1''\n    ''REQUEST_METHOD'' => ''GET''\n    ''QUERY_STRING'' => ''r=admin%2Fsetting%2Fdesign''\n    ''REQUEST_URI'' => ''/Intranet/humhub/index.php?r=admin%2Fsetting%2Fdesign''\n    ''SCRIPT_NAME'' => ''/Intranet/humhub/index.php''\n    ''PHP_SELF'' => ''/Intranet/humhub/index.php''\n    ''REQUEST_TIME_FLOAT'' => 1467332801.394\n    ''REQUEST_TIME'' => 1467332801\n]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_updated` (`updated_at`),
  KEY `index_updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `message_entry`
--

CREATE TABLE IF NOT EXISTS `message_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_message_id` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1467332042),
('m131023_164513_initial', 1467332048),
('m131023_165214_initial', 1467332296),
('m131023_165411_initial', 1467332049),
('m131023_165507_initial', 1467332271),
('m131023_165625_initial', 1467332051),
('m131023_165755_initial', 1467332052),
('m131023_165835_initial', 1467332052),
('m131023_165921_initial', 1467332281),
('m131023_170033_initial', 1467332053),
('m131023_170135_initial', 1467332053),
('m131023_170159_initial', 1467332054),
('m131023_170253_initial', 1467332054),
('m131023_170339_initial', 1467332054),
('m131030_122743_longer_questions', 1467332282),
('m131203_110444_oembed', 1467332055),
('m131213_165552_user_optimize', 1467332059),
('m140226_111945_ldap', 1467332060),
('m140303_125031_password', 1467332062),
('m140304_142711_memberautoadd', 1467332062),
('m140321_000917_content', 1467332063),
('m140324_170617_membership', 1467332064),
('m140507_150421_create_settings_table', 1467332064),
('m140507_171527_create_settings_table', 1467332065),
('m140512_141414_i18n_profilefields', 1467332067),
('m140513_180317_createlogging', 1467332067),
('m140701_000611_profile_genderfield', 1467332067),
('m140701_074404_protect_default_profilefields', 1467332068),
('m140702_143912_notify_notification_unify', 1467332068),
('m140703_104527_profile_birthdayfield', 1467332068),
('m140704_080659_installationid', 1467332068),
('m140705_065525_emailing_settings', 1467332070),
('m140706_135210_lastlogin', 1467332071),
('m140812_093445_rename_deadline_column', 1467332296),
('m140829_122906_delete', 1467332072),
('m140830_145504_following', 1467332074),
('m140901_080147_indizies', 1467332074),
('m140901_080432_indices', 1467332074),
('m140901_112246_addState', 1467332077),
('m140901_153403_addState', 1467332079),
('m140901_170329_group_create_space', 1467332080),
('m140902_091234_session_key_length', 1467332081),
('m140907_140822_zip_field_to_text', 1467332081),
('m140930_045035_initial', 1467332259),
('m140930_205511_fix_default', 1467332083),
('m140930_205859_fix_default', 1467332083),
('m140930_210142_fix_default', 1467332084),
('m140930_210635_fix_default', 1467332086),
('m140930_212528_fix_default', 1467332087),
('m141002_084750_fix_default', 1467332296),
('m141002_092800_fix_deadline', 1467332296),
('m141002_093710_fix_default', 1467332283),
('m141004_022835_initial', 1467332308),
('m141015_173305_follow_notifications', 1467332088),
('m141019_093319_mentioning', 1467332089),
('m141020_162639_fix_default', 1467332092),
('m141020_193920_rm_alsocreated', 1467332092),
('m141020_193931_rm_alsoliked', 1467332092),
('m141021_162639_oembed_setting', 1467332092),
('m141022_094635_addDefaults', 1467332092),
('m141026_135537_adminOnly', 1467332260),
('m141106_185632_log_init', 1467332093),
('m150204_103433_html5_notified', 1467332093),
('m150210_190006_user_invite_lang', 1467332094),
('m150302_114347_add_visibility', 1467332095),
('m150322_194403_remove_type_field', 1467332095),
('m150322_195619_allowedExt2Text', 1467332096),
('m150429_190600_indexes', 1467332272),
('m150429_223856_optimize', 1467332097),
('m150510_102900_update', 1467332097),
('m150629_220311_change', 1467332098),
('m150703_012735_typelength', 1467332099),
('m150703_024635_activityTypes', 1467332099),
('m150703_033650_namespace', 1467332099),
('m150703_130157_migrate', 1467332099),
('m150704_005338_namespace', 1467332099),
('m150704_005418_namespace', 1467332100),
('m150704_005434_namespace', 1467332100),
('m150704_005452_namespace', 1467332100),
('m150704_005504_namespace', 1467332100),
('m150705_081309_namespace', 1467332308),
('m150709_050451_namespace', 1467332272),
('m150709_151858_namespace', 1467332283),
('m150710_055123_namespace', 1467332297),
('m150713_054441_timezone', 1467332101),
('m150714_093525_activity', 1467332103),
('m150714_100355_cleanup', 1467332107),
('m150720_174011_initial', 1467332253),
('m150831_061628_notifications', 1467332107),
('m150910_223305_fix_user_follow', 1467332107),
('m150916_131805_container', 1467332260),
('m150917_104409_add_new_windows', 1467332262),
('m150924_133344_update_notification_fix', 1467332107),
('m150924_154635_user_invite_add_first_lastname', 1467332108),
('m150927_190830_create_contentcontainer', 1467332110),
('m150928_103711_permissions', 1467332111),
('m150928_134934_groups', 1467332113),
('m150928_140718_setColorVariables', 1467332114),
('m151010_124437_group_permissions', 1467332116),
('m151010_175000_default_visibility', 1467332116),
('m151013_223814_include_dashboard', 1467332117),
('m151022_131128_module_fix', 1467332117),
('m151106_090948_addColor', 1467332117),
('m151223_171310_fix_notifications', 1467332117),
('m151224_162440_fix_module_id_notifications', 1467332297),
('m160125_053702_stored_filename', 1467332118),
('m160218_132531_close_and_anonymous_poll', 1467332284),
('m160227_073020_birthday_date', 1467332118),
('m160501_220850_activity_pk_int', 1467332118);

-- --------------------------------------------------------

--
-- Estrutura da tabela `module_enabled`
--

CREATE TABLE IF NOT EXISTS `module_enabled` (
  `module_id` varchar(100) NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `module_enabled`
--

INSERT INTO `module_enabled` (`module_id`) VALUES
('birthday'),
('cfiles'),
('custom_pages'),
('mail'),
('polls'),
('tasks'),
('wiki');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `source_class` varchar(100) DEFAULT NULL,
  `source_pk` int(11) DEFAULT NULL,
  `space_id` int(11) DEFAULT NULL,
  `emailed` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `desktop_notified` tinyint(1) DEFAULT '0',
  `originator_user_id` int(11) DEFAULT NULL,
  `module` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_seen` (`seen`),
  KEY `index_desktop_notified` (`desktop_notified`),
  KEY `index_desktop_emailed` (`emailed`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `notification`
--

INSERT INTO `notification` (`id`, `class`, `user_id`, `seen`, `source_class`, `source_pk`, `space_id`, `emailed`, `created_at`, `desktop_notified`, `originator_user_id`, `module`) VALUES
(1, 'humhub\\modules\\comment\\notifications\\NewComment', 1, 1, 'humhub\\modules\\comment\\models\\Comment', 1, 1, 0, '2016-06-30 21:24:51', 1, 2, 'comment'),
(2, 'humhub\\modules\\comment\\notifications\\NewComment', 1, 1, 'humhub\\modules\\comment\\models\\Comment', 2, 1, 0, '2016-06-30 21:24:51', 1, 3, 'comment'),
(3, 'humhub\\modules\\comment\\notifications\\NewComment', 2, 0, 'humhub\\modules\\comment\\models\\Comment', 2, 1, 0, '2016-06-30 21:24:51', 0, 3, 'comment'),
(4, 'humhub\\modules\\like\\notifications\\NewLike', 1, 1, 'humhub\\modules\\like\\models\\Like', 1, 1, 0, '2016-06-30 21:24:52', 1, 3, 'like'),
(5, 'humhub\\modules\\like\\notifications\\NewLike', 2, 0, 'humhub\\modules\\like\\models\\Like', 1, 1, 0, '2016-06-30 21:24:52', 0, 3, 'like'),
(6, 'humhub\\modules\\comment\\notifications\\NewComment', 1, 1, 'humhub\\modules\\comment\\models\\Comment', 3, 1, 0, '2016-06-30 21:24:54', 1, 2, 'comment'),
(7, 'humhub\\modules\\comment\\notifications\\NewComment', 1, 1, 'humhub\\modules\\comment\\models\\Comment', 4, 1, 0, '2016-06-30 21:24:55', 1, 3, 'comment'),
(8, 'humhub\\modules\\comment\\notifications\\NewComment', 2, 0, 'humhub\\modules\\comment\\models\\Comment', 4, 1, 0, '2016-06-30 21:24:55', 0, 3, 'comment');

-- --------------------------------------------------------

--
-- Estrutura da tabela `poll`
--

CREATE TABLE IF NOT EXISTS `poll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `allow_multiple` smallint(6) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `is_random` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `anonymous` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `poll`
--

INSERT INTO `poll` (`id`, `question`, `allow_multiple`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_random`, `closed`, `anonymous`) VALUES
(1, 'Right now, we are in the planning stages for our next meetup and we would like to know from you, where you would like to go?', 0, '2016-06-30 21:24:52', 1, '2016-06-30 21:24:52', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `poll_answer`
--

CREATE TABLE IF NOT EXISTS `poll_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `poll_answer`
--

INSERT INTO `poll_answer` (`id`, `poll_id`, `answer`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 'To Daniel', '2016-06-30 21:24:53', 1, '2016-06-30 21:24:53', 1),
(2, 1, 'Club A Steakhouse', '2016-06-30 21:24:53', 1, '2016-06-30 21:24:53', 1),
(3, 1, 'Pisillo Italian Panini', '2016-06-30 21:24:53', 1, '2016-06-30 21:24:53', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `poll_answer_user`
--

CREATE TABLE IF NOT EXISTS `poll_answer_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `poll_answer_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `poll_answer_user`
--

INSERT INTO `poll_answer_user` (`id`, `poll_id`, `poll_answer_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 2, '2016-06-30 21:24:53', 2, '2016-06-30 21:24:53', 2),
(2, 1, 3, '2016-06-30 21:24:54', 3, '2016-06-30 21:24:54', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_2trash` text,
  `message` text,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `post`
--

INSERT INTO `post` (`id`, `message_2trash`, `message`, `url`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, NULL, 'Yay! I''ve just installed HumHub ;Cool;', NULL, '2016-06-30 21:24:30', 1, '2016-06-30 21:24:30', 1),
(2, NULL, 'We''re looking for great slogans of famous brands. Maybe you can come up with some samples?', NULL, '2016-06-30 21:24:50', 1, '2016-06-30 21:24:50', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `birthday_hide_year` int(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `about` text,
  `phone_private` varchar(255) DEFAULT NULL,
  `phone_work` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `im_skype` varchar(255) DEFAULT NULL,
  `im_msn` varchar(255) DEFAULT NULL,
  `im_xmpp` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_facebook` varchar(255) DEFAULT NULL,
  `url_linkedin` varchar(255) DEFAULT NULL,
  `url_xing` varchar(255) DEFAULT NULL,
  `url_youtube` varchar(255) DEFAULT NULL,
  `url_vimeo` varchar(255) DEFAULT NULL,
  `url_flickr` varchar(255) DEFAULT NULL,
  `url_myspace` varchar(255) DEFAULT NULL,
  `url_googleplus` varchar(255) DEFAULT NULL,
  `url_twitter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `profile`
--

INSERT INTO `profile` (`user_id`, `firstname`, `lastname`, `title`, `gender`, `street`, `zip`, `city`, `country`, `state`, `birthday_hide_year`, `birthday`, `about`, `phone_private`, `phone_work`, `mobile`, `fax`, `im_skype`, `im_msn`, `im_xmpp`, `url`, `url_facebook`, `url_linkedin`, `url_xing`, `url_youtube`, `url_vimeo`, `url_flickr`, `url_myspace`, `url_googleplus`, `url_twitter`) VALUES
(1, 'Junior', 'Nascimento', 'System Administration', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'David', 'Roberts', 'Late riser', NULL, '2443 Queens Lane', '24574', 'Allwood', 'Virginia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Sara', 'Schuster', 'Do-gooder', NULL, 'Schmarjestrasse 51', '17095', 'Friedland', 'Niedersachsen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `profile_field`
--

CREATE TABLE IF NOT EXISTS `profile_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_field_category_id` int(11) NOT NULL,
  `module_id` varchar(255) DEFAULT NULL,
  `field_type_class` varchar(255) NOT NULL,
  `field_type_config` text,
  `internal_name` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `sort_order` int(11) NOT NULL DEFAULT '100',
  `required` tinyint(4) DEFAULT NULL,
  `show_at_registration` tinyint(4) DEFAULT NULL,
  `editable` tinyint(4) NOT NULL DEFAULT '1',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_attribute` varchar(255) DEFAULT NULL,
  `translation_category` varchar(255) DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_profile_field_category` (`profile_field_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Extraindo dados da tabela `profile_field`
--

INSERT INTO `profile_field` (`id`, `profile_field_category_id`, `module_id`, `field_type_class`, `field_type_config`, `internal_name`, `title`, `description`, `sort_order`, `required`, `show_at_registration`, `editable`, `visible`, `created_at`, `created_by`, `updated_at`, `updated_by`, `ldap_attribute`, `translation_category`, `is_system`) VALUES
(1, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":20,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'firstname', 'First name', NULL, 100, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 'givenName', NULL, 1),
(2, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":30,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'lastname', 'Last name', NULL, 200, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 'sn', NULL, 1),
(3, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":50,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'title', 'Title', NULL, 300, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 'title', NULL, 1),
(4, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Select', '{"options":"male=>Male\\nfemale=>Female\\ncustom=>Custom","fieldTypes":[]}', 'gender', 'Gender', NULL, 300, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(5, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":150,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'street', 'Street', NULL, 400, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(6, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":10,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'zip', 'Zip', NULL, 500, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(7, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'city', 'City', NULL, 600, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(8, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'country', 'Country', NULL, 700, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(9, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'state', 'State', NULL, 800, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(10, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Birthday', '{"defaultHideAge":false,"fieldTypes":[]}', 'birthday', 'Birthday', NULL, 900, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(11, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\TextArea', '{"fieldTypes":[]}', 'about', 'About', NULL, 900, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(12, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'phone_private', 'Phone Private', NULL, 100, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(13, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'phone_work', 'Phone Work', NULL, 200, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(14, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'mobile', 'Mobile', NULL, 300, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(15, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'fax', 'Fax', NULL, 400, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(16, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'im_skype', 'Skype Nickname', NULL, 500, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(17, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'im_msn', 'MSN', NULL, 600, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(18, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"email","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'im_xmpp', 'XMPP Jabber Address', NULL, 800, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(19, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url', 'Url', NULL, 100, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(20, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_facebook', 'Facebook URL', NULL, 200, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(21, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_linkedin', 'LinkedIn URL', NULL, 300, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(22, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_xing', 'Xing URL', NULL, 400, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(23, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_youtube', 'Youtube URL', NULL, 500, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(24, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_vimeo', 'Vimeo URL', NULL, 600, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(25, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_flickr', 'Flickr URL', NULL, 700, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(26, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_myspace', 'MySpace URL', NULL, 800, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(27, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_googleplus', 'Google+ URL', NULL, 900, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(28, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_twitter', 'Twitter URL', NULL, 1000, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `profile_field_category`
--

CREATE TABLE IF NOT EXISTS `profile_field_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '100',
  `module_id` int(11) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `translation_category` varchar(255) DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `profile_field_category`
--

INSERT INTO `profile_field_category` (`id`, `title`, `description`, `sort_order`, `module_id`, `visibility`, `created_at`, `created_by`, `updated_at`, `updated_by`, `translation_category`, `is_system`) VALUES
(1, 'General', '', 100, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1),
(2, 'Communication', '', 200, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1),
(3, 'Social bookmarks', '', 300, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `value_text` text,
  `module_id` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Extraindo dados da tabela `setting`
--

INSERT INTO `setting` (`id`, `name`, `value`, `value_text`, `module_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'oembedProviders', NULL, '{"vimeo.com":"http:\\/\\/vimeo.com\\/api\\/oembed.json?scheme=https&url=%url%&format=json&maxwidth=450","youtube.com":"http:\\/\\/www.youtube.com\\/oembed?scheme=https&url=%url%&format=json&maxwidth=450","youtu.be":"http:\\/\\/www.youtube.com\\/oembed?scheme=https&url=%url%&format=json&maxwidth=450","soundcloud.com":"https:\\/\\/soundcloud.com\\/oembed?url=%url%&format=json&maxwidth=450","slideshare.net":"https:\\/\\/www.slideshare.net\\/api\\/oembed\\/2?url=%url%&format=json&maxwidth=450"}', NULL, NULL, NULL, NULL, NULL),
(2, 'defaultVisibility', '1', NULL, 'space', NULL, NULL, NULL, NULL),
(3, 'defaultJoinPolicy', '1', NULL, 'space', NULL, NULL, NULL, NULL),
(4, 'colorDefault', '#ededed', NULL, '', NULL, NULL, NULL, NULL),
(5, 'colorPrimary', '#708fa0', NULL, '', NULL, NULL, NULL, NULL),
(6, 'colorInfo', '#6fdbe8', NULL, '', NULL, NULL, NULL, NULL),
(7, 'colorSuccess', '#97d271', NULL, '', NULL, NULL, NULL, NULL),
(8, 'colorWarning', '#fdd198', NULL, '', NULL, NULL, NULL, NULL),
(9, 'colorDanger', '#ff8989', NULL, '', NULL, NULL, NULL, NULL),
(10, 'name', 'Webister', NULL, '', NULL, NULL, NULL, NULL),
(11, 'baseUrl', 'http://localhost/Intranet/humhub', NULL, '', NULL, NULL, NULL, NULL),
(12, 'paginationSize', '10', NULL, '', NULL, NULL, NULL, NULL),
(13, 'displayNameFormat', '{profile.firstname} {profile.lastname}', NULL, '', NULL, NULL, NULL, NULL),
(14, 'authInternal', '1', NULL, 'authentication', NULL, NULL, NULL, NULL),
(15, 'authLdap', '0', NULL, 'authentication', NULL, NULL, NULL, NULL),
(16, 'refreshUsers', '1', NULL, 'authentication_ldap', NULL, NULL, NULL, NULL),
(17, 'needApproval', '0', NULL, 'authentication_internal', NULL, NULL, NULL, NULL),
(18, 'anonymousRegistration', '0', NULL, 'authentication_internal', NULL, NULL, NULL, NULL),
(20, 'transportType', 'php', NULL, 'mailing', NULL, NULL, NULL, NULL),
(21, 'systemEmailAddress', 'social@example.com', NULL, 'mailing', NULL, NULL, NULL, NULL),
(22, 'systemEmailName', 'Webister', NULL, 'mailing', NULL, NULL, NULL, NULL),
(23, 'receive_email_activities', '1', NULL, 'mailing', NULL, NULL, NULL, NULL),
(24, 'receive_email_notifications', '2', NULL, 'mailing', NULL, NULL, NULL, NULL),
(25, 'maxFileSize', '1048576', NULL, 'file', NULL, NULL, NULL, NULL),
(26, 'maxPreviewImageWidth', '200', NULL, 'file', NULL, NULL, NULL, NULL),
(27, 'maxPreviewImageHeight', '200', NULL, 'file', NULL, NULL, NULL, NULL),
(28, 'hideImageFileInfo', '0', NULL, 'file', NULL, NULL, NULL, NULL),
(29, 'type', 'CFileCache', NULL, 'cache', NULL, NULL, NULL, NULL),
(30, 'expireTime', '3600', NULL, 'cache', NULL, NULL, NULL, NULL),
(31, 'installationId', '8973b53b96218a48e5b1413e68a68600', NULL, 'admin', NULL, NULL, NULL, NULL),
(32, 'theme', 'HumHub', NULL, '', NULL, NULL, NULL, NULL),
(33, 'spaceOrder', '0', NULL, 'space', NULL, NULL, NULL, NULL),
(34, 'enable', '1', NULL, 'tour', NULL, NULL, NULL, NULL),
(35, 'enable', '1', NULL, 'share', NULL, NULL, NULL, NULL),
(36, 'defaultLanguage', 'pt_br', NULL, '', NULL, NULL, NULL, NULL),
(37, 'enable_html5_desktop_notifications', '0', NULL, 'notification', NULL, NULL, NULL, NULL),
(38, 'useCase', 'intranet', NULL, '', NULL, NULL, NULL, NULL),
(39, 'allowGuestAccess', '1', NULL, 'authentication_internal', NULL, NULL, NULL, NULL),
(40, 'shownDays', '2', NULL, 'birthday', NULL, NULL, NULL, NULL),
(41, 'sampleData', '1', NULL, 'installer', NULL, NULL, NULL, NULL),
(42, 'secret', '8c5ac4ca-fa3e-431d-b29e-b7077c85f6a9', NULL, '', NULL, NULL, NULL, NULL),
(43, 'timeZone', 'America/Sao_Paulo', NULL, '', NULL, NULL, NULL, NULL),
(44, 'showProfilePostForm', '0', NULL, 'dashboard', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `space`
--

CREATE TABLE IF NOT EXISTS `space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `wall_id` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` text,
  `website` varchar(45) DEFAULT NULL,
  `join_policy` tinyint(4) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `tags` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `auto_add_new_members` int(4) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `default_content_visibility` tinyint(1) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `space`
--

INSERT INTO `space` (`id`, `guid`, `wall_id`, `name`, `description`, `website`, `join_policy`, `visibility`, `status`, `tags`, `created_at`, `created_by`, `updated_at`, `updated_by`, `ldap_dn`, `auto_add_new_members`, `contentcontainer_id`, `default_content_visibility`, `color`) VALUES
(1, '1ba420fb-c094-40ae-ad39-82a0386ce2d4', 2, 'Welcome Space', 'Your first sample space to discover the platform.', NULL, 2, 2, 1, NULL, '2016-06-30 21:24:29', 1, '2016-06-30 21:24:29', 1, NULL, 1, 2, NULL, '#6fdbe8');

-- --------------------------------------------------------

--
-- Estrutura da tabela `space_membership`
--

CREATE TABLE IF NOT EXISTS `space_membership` (
  `space_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `originator_user_id` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `request_message` text,
  `last_visit` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT 'member',
  `show_at_dashboard` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`space_id`,`user_id`),
  KEY `index_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `space_membership`
--

INSERT INTO `space_membership` (`space_id`, `user_id`, `originator_user_id`, `status`, `request_message`, `last_visit`, `created_at`, `created_by`, `updated_at`, `updated_by`, `group_id`, `show_at_dashboard`) VALUES
(1, 1, NULL, 3, NULL, '2016-06-30 21:28:35', NULL, NULL, NULL, NULL, 'admin', 1),
(1, 2, NULL, 3, NULL, '2016-06-30 21:24:54', NULL, NULL, NULL, NULL, 'member', 1),
(1, 3, NULL, 3, NULL, '2016-06-30 21:24:54', NULL, NULL, NULL, NULL, 'member', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `space_module`
--

CREATE TABLE IF NOT EXISTS `space_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(255) NOT NULL,
  `space_id` int(11) NOT NULL,
  `state` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `space_module`
--

INSERT INTO `space_module` (`id`, `module_id`, `space_id`, `state`) VALUES
(1, 'cfiles', 1, 1),
(2, 'custom_pages', 1, 1),
(3, 'polls', 1, 1),
(4, 'tasks', 1, 1),
(5, 'wiki', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `space_setting`
--

CREATE TABLE IF NOT EXISTS `space_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `space_id` int(10) DEFAULT NULL,
  `module_id` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_space_setting` (`space_id`,`module_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `task`
--

CREATE TABLE IF NOT EXISTS `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `max_users` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `percent` smallint(6) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `task_user`
--

CREATE TABLE IF NOT EXISTS `task_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `url_oembed`
--

CREATE TABLE IF NOT EXISTS `url_oembed` (
  `url` varchar(255) NOT NULL,
  `preview` text NOT NULL,
  PRIMARY KEY (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `wall_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `super_admin` tinyint(4) NOT NULL DEFAULT '0',
  `username` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `auth_mode` varchar(10) NOT NULL,
  `tags` text,
  `language` varchar(5) DEFAULT NULL,
  `last_activity_email` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `visibility` int(1) DEFAULT '1',
  `time_zone` varchar(100) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_username` (`username`),
  UNIQUE KEY `unique_guid` (`guid`),
  UNIQUE KEY `unique_wall_id` (`wall_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `guid`, `wall_id`, `group_id`, `status`, `super_admin`, `username`, `email`, `auth_mode`, `tags`, `language`, `last_activity_email`, `created_at`, `created_by`, `updated_at`, `updated_by`, `last_login`, `visibility`, `time_zone`, `contentcontainer_id`) VALUES
(1, 'f3b9b107-161a-4b3a-ab64-597b8fb42e4e', 1, 1, 1, 1, 'junior', 'junior@webister.com.br', 'local', 'Administration, Support, HumHub', '', '2016-06-30 21:24:27', '2016-06-30 21:24:27', NULL, '2016-06-30 21:25:35', 1, '2016-06-30 21:25:35', 1, 'Europe/Paris', 1),
(2, 'f9d43c0b-de1a-47b4-a088-188ddb63a06b', 3, 1, 1, 0, 'david1986', 'david.roberts@humhub.com', 'local', 'Microsoft Office, Marketing, SEM, Digital Native', '', '2016-06-30 21:24:47', '2016-06-30 21:24:47', 1, '2016-06-30 21:24:47', 1, NULL, 1, NULL, 3),
(3, 'ff169a1d-f48a-4326-8113-b390cce79d2c', 4, 1, 1, 0, 'sara1989', 'sara.schuster@humhub.com', 'local', 'Yoga, Travel, English, German, French', '', '2016-06-30 21:24:48', '2016-06-30 21:24:48', 1, '2016-06-30 21:24:48', 1, NULL, 1, NULL, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_follow`
--

CREATE TABLE IF NOT EXISTS `user_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `send_notifications` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_user` (`user_id`),
  KEY `index_object` (`object_model`,`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `user_follow`
--

INSERT INTO `user_follow` (`id`, `object_model`, `object_id`, `user_id`, `send_notifications`) VALUES
(1, 'humhub\\modules\\post\\models\\Post', 1, 1, 1),
(2, 'humhub\\modules\\post\\models\\Post', 2, 1, 1),
(3, 'humhub\\modules\\post\\models\\Post', 2, 2, 1),
(4, 'humhub\\modules\\post\\models\\Post', 2, 3, 1),
(5, 'humhub\\modules\\polls\\models\\Poll', 1, 1, 1),
(6, 'humhub\\modules\\polls\\models\\Poll', 1, 2, 1),
(7, 'humhub\\modules\\polls\\models\\Poll', 1, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_http_session`
--

CREATE TABLE IF NOT EXISTS `user_http_session` (
  `id` char(255) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `user_http_session`
--

INSERT INTO `user_http_session` (`id`, `expire`, `user_id`, `data`) VALUES
('h25vh32au5qpfdj7neho3aiv71', 1467334729, 1, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_invite`
--

CREATE TABLE IF NOT EXISTS `user_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_originator_id` int(11) DEFAULT NULL,
  `space_invite_id` int(11) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_mentioning`
--

CREATE TABLE IF NOT EXISTS `user_mentioning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i_user` (`user_id`),
  KEY `i_object` (`object_model`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_message`
--

CREATE TABLE IF NOT EXISTS `user_message` (
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_originator` tinyint(4) DEFAULT NULL,
  `last_viewed` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`message_id`,`user_id`),
  KEY `index_last_viewed` (`last_viewed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_module`
--

CREATE TABLE IF NOT EXISTS `user_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `state` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_module` (`user_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_password`
--

CREATE TABLE IF NOT EXISTS `user_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `algorithm` varchar(20) DEFAULT NULL,
  `password` text,
  `salt` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `user_password`
--

INSERT INTO `user_password` (`id`, `user_id`, `algorithm`, `password`, `salt`, `created_at`) VALUES
(1, 1, 'sha512whirlpool', '411369fd99aec1e6cd3f5aeced36a2c343a9f92798b18bb5e4e0ed500aeb902cd4bc2772a9aa4cd8f542842fe80b637f9d0231ca0d9e51d9b9cf234851af2b11', '91dfd056-cca8-41bc-ae10-4a2b26b92998', '2016-06-30 21:24:28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_setting`
--

CREATE TABLE IF NOT EXISTS `user_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `module_id` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_setting` (`user_id`,`module_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wall`
--

CREATE TABLE IF NOT EXISTS `wall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(50) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `wall`
--

INSERT INTO `wall` (`id`, `object_model`, `object_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'humhub\\modules\\user\\models\\User', 1, NULL, NULL, NULL, NULL),
(2, 'humhub\\modules\\space\\models\\Space', 1, NULL, NULL, NULL, NULL),
(3, 'humhub\\modules\\user\\models\\User', 2, NULL, NULL, NULL, NULL),
(4, 'humhub\\modules\\user\\models\\User', 3, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `wall_entry`
--

CREATE TABLE IF NOT EXISTS `wall_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wall_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Extraindo dados da tabela `wall_entry`
--

INSERT INTO `wall_entry` (`id`, `wall_id`, `content_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 2, 3, '2016-06-30 21:24:31', 1, '2016-06-30 21:24:31', 1),
(2, 2, 2, '2016-06-30 21:24:31', 1, '2016-06-30 21:24:31', 1),
(3, 2, 4, '2016-06-30 21:24:47', 1, '2016-06-30 21:24:47', 1),
(4, 2, 5, '2016-06-30 21:24:49', 1, '2016-06-30 21:24:49', 1),
(5, 2, 7, '2016-06-30 21:24:50', 1, '2016-06-30 21:24:50', 1),
(6, 2, 6, '2016-06-30 21:24:50', 1, '2016-06-30 21:24:50', 1),
(7, 2, 8, '2016-06-30 21:24:51', 2, '2016-06-30 21:24:51', 2),
(8, 2, 9, '2016-06-30 21:24:51', 3, '2016-06-30 21:24:51', 3),
(9, 2, 10, '2016-06-30 21:24:52', 3, '2016-06-30 21:24:52', 3),
(10, 2, 12, '2016-06-30 21:24:53', 1, '2016-06-30 21:24:53', 1),
(11, 2, 11, '2016-06-30 21:24:53', 1, '2016-06-30 21:24:53', 1),
(12, 2, 13, '2016-06-30 21:24:54', 2, '2016-06-30 21:24:54', 2),
(13, 2, 14, '2016-06-30 21:24:54', 2, '2016-06-30 21:24:54', 2),
(14, 2, 15, '2016-06-30 21:24:54', 3, '2016-06-30 21:24:54', 3),
(15, 2, 16, '2016-06-30 21:24:54', 3, '2016-06-30 21:24:54', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `wiki_page`
--

CREATE TABLE IF NOT EXISTS `wiki_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_home` tinyint(4) NOT NULL DEFAULT '0',
  `admin_only` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wiki_page_revision`
--

CREATE TABLE IF NOT EXISTS `wiki_page_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision` int(11) NOT NULL,
  `is_latest` tinyint(1) NOT NULL DEFAULT '0',
  `wiki_page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
