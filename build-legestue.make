; drush make API version
api = 2
core = 7.x

includes[buildthat] = https://raw.githubusercontent.com/lsolesen/buildthat/7.x-1.x/build-buildthat.make

projects[legestue_net][type] = "profile"
projects[legestue_net][download][type] = "git"
projects[legestue_net][download][url] = "git://github.com/lsolesen/legestue.net.git"
projects[legestue_net][download][branch] = "7.x-1.x"
