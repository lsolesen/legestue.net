<?php

/**
 * Return a description of the profile for the initial installation screen.
 *
 * @return
 *   An array with keys 'name' and 'description' describing this profile.
 */
function legestue_net_profile_details() {
  return array(
    'name' => 'legestue.net',
    'description' => 'Select this profile to deploy an instance of legestue.net.'
  );
}

/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * @return
 *  An array of modules to be enabled.
 */
function legestue_net_profile_modules() {
  return array(
    /* optional core */
    'menu', 'comment', 'color', 'dblog', 'help', 'taxonomy',
    'aggregator', 'book', 'contact', 'path', 'profile', 'search',
    'actions', 'trigger', 'upload', 'update',
    /* other contrib */ 
    'install_profile_api', 'admin_menu', 'captcha', 
    'geshifilter', 'pathauto', 'recaptcha',
    'tagadelic', 'token', 'twitter', 'twitter_actions', 'twitter_post', 
    'views', 'lightbox2', 'image', 'mailhandler',
    'mailsave', 'mailsave_to_image', 'googleanalytics',
  );
}

/**
* Implementation of hook_profile_tasks().
*/
function legestue_net_profile_tasks() {

  // Install the core required modules and our extra modules
  $core_required = array('block', 'filter', 'node', 'system', 'user');
  install_include(array_merge(mig5_net_profile_modules(), $core_required));

  // Change anonymous user's permissions - since anonymous user is always rid 1 we don't need to retrieve it
  $perms = array(
    'access content', 
    'access comments', 
    'post comments',
  );

  install_add_permissions(1, $perms);


  // Insert default user-defined node types into the database. For a complete
  // list of available node type attributes, refer to the node type API
  // documentation at: http://api.drupal.org/api/HEAD/function/hook_node_info.
  $types = array(
    array(
      'type' => 'page',
      'name' => st('Page'),
      'module' => 'node',
      'description' => st("A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site's initial home page."),
      'custom' => TRUE,
      'modified' => TRUE,
      'locked' => FALSE,
      'help' => '',
      'min_word_count' => '',
    ),
    array(
      'type' => 'story',
      'name' => st('Story'),
      'module' => 'node',
      'description' => st("A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site's initial home page, and provides the ability to post comments."),
      'custom' => TRUE,
      'modified' => TRUE,
      'locked' => FALSE,
      'help' => '',
      'min_word_count' => '',
    ),
  );

  foreach ($types as $type) {
    $type = (object) _node_type_set_defaults($type);
    node_type_save($type);
  }

  // Enable default theme
  install_default_theme("motion");

  // Put the navigation block in the sidebar because the sidebar looks awesome.
  install_init_blocks();
  // Navigation
  install_set_block('user', 1, 'singular', 'right');
  // About
  install_set_block('block', 1, 'singular', 'right');
  // Recent tweets
  install_set_block('views', 'tweets-block2', 'singular', 'right');
  // Recent comments
  install_set_block('views', 'comments_recent-block', 'singular', 'right');
}

