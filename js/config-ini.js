// Generated by CoffeeScript 1.6.3
(function() {
  var fs, iniparser;

  fs = require('fs');

  iniparser = require('iniparser');

  module.exports.load = function(file, callback) {
    var load;
    if (callback == null) {
      callback = file;
      file = 'config.ini';
    }
    load = function(file, cb) {
      return fs.readFile(file, 'utf8', function(err, data) {
        var config, k, section, v, values;
        if (!err) {
          config = iniparser.parseString(data);
          for (section in config) {
            values = config[section];
            module.exports[section] = module.exports[section] || {};
            for (k in values) {
              v = values[k];
              module.exports[section][k] = v;
            }
          }
        }
        return cb();
      });
    };
    return load('config.ini', function() {
      return load('config.dev.ini', function() {
        if (typeof module.exports.load === 'function') {
          delete module.exports.load;
        }
        if (typeof callback === 'function') {
          return callback();
        }
      });
    });
  };

}).call(this);
