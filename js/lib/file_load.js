// Generated by CoffeeScript 1.6.3
(function() {
  var fs, iniparser;

  fs = require('fs');

  iniparser = require('iniparser');

  module.exports = function(exporter, file, callback) {
    return fs.readFile(file, 'utf8', function(err, data) {
      var config, k, section, v, values;
      if (err) {
        return callback(err);
      }
      try {
        config = iniparser.parseString(data);
        for (section in config) {
          values = config[section];
          exporter[section] = exporter[section] || {};
          for (k in values) {
            v = values[k];
            exporter[section][k] = v;
          }
        }
        return callback();
      } catch (_error) {
        err = _error;
        return callback(err);
      }
    });
  };

}).call(this);
