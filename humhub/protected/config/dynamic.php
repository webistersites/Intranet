<?php return array (
  'components' => 
  array (
    'db' => 
    array (
      'class' => 'yii\\db\\Connection',
      'dsn' => 'mysql:host=localhost;dbname=humhub',
      'username' => 'root',
      'password' => '',
      'charset' => 'utf8',
    ),
    'user' => 
    array (
    ),
    'mailer' => 
    array (
      'transport' => 
      array (
        'class' => 'Swift_MailTransport',
      ),
      'view' => 
      array (
        'theme' => 
        array (
          'name' => 'HumHub',
          'basePath' => 'C:/wamp/www/Intranet/humhub/themes\\HumHub',
        ),
      ),
    ),
    'view' => 
    array (
      'theme' => 
      array (
        'name' => 'HumHub',
        'basePath' => 'C:/wamp/www/Intranet/humhub/themes\\HumHub',
      ),
    ),
    'formatter' => 
    array (
      'defaultTimeZone' => 'America/Sao_Paulo',
    ),
    'formatterApp' => 
    array (
      'defaultTimeZone' => 'America/Sao_Paulo',
      'timeZone' => 'America/Sao_Paulo',
    ),
  ),
  'params' => 
  array (
    'installer' => 
    array (
      'db' => 
      array (
        'installer_hostname' => 'localhost',
        'installer_database' => 'humhub',
      ),
    ),
    'settings' => 
    array (
      'core' => 
      array (
        'colorDefault' => '#ededed',
        'colorPrimary' => '#708fa0',
        'colorInfo' => '#6fdbe8',
        'colorSuccess' => '#97d271',
        'colorWarning' => '#fdd198',
        'colorDanger' => '#ff8989',
        'oembedProviders' => '{"vimeo.com":"http:\\/\\/vimeo.com\\/api\\/oembed.json?scheme=https&url=%url%&format=json&maxwidth=450","youtube.com":"http:\\/\\/www.youtube.com\\/oembed?scheme=https&url=%url%&format=json&maxwidth=450","youtu.be":"http:\\/\\/www.youtube.com\\/oembed?scheme=https&url=%url%&format=json&maxwidth=450","soundcloud.com":"https:\\/\\/soundcloud.com\\/oembed?url=%url%&format=json&maxwidth=450","slideshare.net":"https:\\/\\/www.slideshare.net\\/api\\/oembed\\/2?url=%url%&format=json&maxwidth=450"}',
        'name' => 'Webister',
        'baseUrl' => 'http://localhost/Intranet/humhub',
        'paginationSize' => '10',
        'displayNameFormat' => '{profile.firstname} {profile.lastname}',
        'theme' => 'HumHub',
        'defaultLanguage' => 'pt_br',
        'useCase' => 'intranet',
        'secret' => '8c5ac4ca-fa3e-431d-b29e-b7077c85f6a9',
        'timeZone' => 'America/Sao_Paulo',
      ),
      'space' => 
      array (
        'defaultVisibility' => '1',
        'defaultJoinPolicy' => '1',
        'spaceOrder' => '0',
      ),
      'authentication' => 
      array (
        'authInternal' => '1',
        'authLdap' => '0',
      ),
      'authentication_ldap' => 
      array (
        'refreshUsers' => '1',
      ),
      'authentication_internal' => 
      array (
        'needApproval' => '0',
        'anonymousRegistration' => '0',
        'internalUsersCanInvite' => '',
        'allowGuestAccess' => '1',
      ),
      'mailing' => 
      array (
        'transportType' => 'php',
        'systemEmailAddress' => 'social@example.com',
        'systemEmailName' => 'Webister',
        'receive_email_activities' => '1',
        'receive_email_notifications' => '2',
      ),
      'file' => 
      array (
        'maxFileSize' => '1048576',
        'maxPreviewImageWidth' => '200',
        'maxPreviewImageHeight' => '200',
        'hideImageFileInfo' => '0',
      ),
      'cache' => 
      array (
        'type' => 'CFileCache',
        'expireTime' => '3600',
      ),
      'admin' => 
      array (
        'installationId' => '8973b53b96218a48e5b1413e68a68600',
      ),
      'tour' => 
      array (
        'enable' => '1',
      ),
      'share' => 
      array (
        'enable' => '1',
      ),
      'notification' => 
      array (
        'enable_html5_desktop_notifications' => '0',
      ),
      'birthday' => 
      array (
        'shownDays' => '2',
      ),
      'installer' => 
      array (
        'sampleData' => '1',
      ),
      'dashboard' => 
      array (
        'showProfilePostForm' => '0',
      ),
    ),
    'config_created_at' => 1467332794,
    'databaseInstalled' => true,
    'installed' => true,
  ),
  'name' => 'Webister',
  'language' => 'pt_br',
  'timeZone' => 'America/Sao_Paulo',
); ?>