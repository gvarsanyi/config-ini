fs        = require 'fs'
iniparser = require 'iniparser'

module.exports = (exporter, file, fail_silently, cb) ->
  fs.readFile file, 'utf8', (err, data) ->
    unless err
      config = iniparser.parseString data
      for section, values of config
        exporter[section] = exporter[section] or {}
        exporter[section][k] = v for k, v of values
    else unless fail_silently
      throw new Error 'File not found: ' + file

    cb()
