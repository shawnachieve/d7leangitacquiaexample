<?php
// Set the site base URL:
$base_url = 'http://www.d7leangitacquiaexample.local';

/**
 * Local database configuration settings.
 */
$databases['default']['default'] = array(
  'driver' => 'mysql',
  'database' => 'drupal',
  'username' => 'drupal',
  'password' => 'drupal',
  'host' => '127.0.0.1',
  'port' => 3306,
  'prefix' => '',
  'collation' => 'utf8_general_ci',
);

// Configure Memcache support.
$conf['memcache_servers']  = array('localhost:11211' => 'default');


/**
 * Ensure all errors and warnings are output and logged.
 */
ini_set('error_reporting', E_ALL | E_STRICT);
ini_set('log_errors', 1);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
ini_set('html_errors', 'off');


// Prevent XMLSitemap from submitting sitemap changes to search engines
// on non-production environments.
$conf['xmlsitemap_engines_engines'] = array();

// Allow the dev to temporarily override the default settings in their local dev environment.
$local_settings_file = $_SERVER["DOCUMENT_ROOT"] . '/../config/settings.local.override.php';
if (file_exists($local_settings_file)) {
  include $local_settings_file;
}
