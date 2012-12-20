[Legestue.net](http://legestue.net) [![Build Status](https://secure.travis-ci.org/lsolesen/legestue.net.png?branch=7.x-1.x)](http://travis-ci.org/lsolesen/legestue.net)
==

Instructions on how to build [legestue.net](http://legestue.net) from a standard Drupal 7.

Requirements
------------

* [drush](http://drupal.org/project/drush) 
* [drush_make](http://drupal.org/project/drush_make)

Installation
------------

    sudo drush make legestue_net.build ~/workspace/legestue_net_build
    
Create the settings.php in sites/default and chmod 755
Create the files directory in sites/default and chmod 755

Navigate to the root directory in a webbrowser.
  
Create the settings.php in sites/default and chmod 755
Create "files" directory in sites/default and chmod 755

Navigate to the root directory in a webbrowser and run the install profile.

#### Update existing install profile ####

If you want to update just the install profile instead of rebuilding the
entire site, you can run this:

    drush make --no-core --contrib-destination=. legestue_net.make

### Rebuild everything ###

    drush si legestue_net

