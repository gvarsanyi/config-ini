fs        = require 'fs'
iniparser = require 'iniparser'

module.exports = (exporter, file, cb) ->
  fs.readFile file, 'utf8', (err, data) ->
    unless err
      config = iniparser.parseString data
      for section, values of config
        exporter[section] = exporter[section] or {}
        exporter[section][k] = v for k, v of values
    else
      cb err

    cb()
