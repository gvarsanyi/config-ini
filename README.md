config-ini
==========

# Description
Easy-to-use INI config file management built on top of iniparser

# What it does
Loads INI file (or files in specified order) and makes contents available.


    node yourscript.js --config=config.ini
    node yourscript.js --config=config.ini

If you run your script

# Install
npm install config-ini


1. Link:
var config = require('config-ini');

2. Load 
config.load(function () {
  console.log('Config is accessible, properties have been added to the module.');
});

