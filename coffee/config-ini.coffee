fs        = require 'fs'
iniparser = require 'iniparser'

module.exports.load = (file, callback) ->
  if not callback?
    callback = file
    file = 'config.ini'

  load = (file, cb) ->
    fs.readFile file, 'utf8', (err, data) ->
      if not err
        config = iniparser.parseString data
        for section, values of config
          module.exports[section] = module.exports[section] or {}
          (module.exports[section][k] = v) for k, v of values
      cb()

  load 'config.ini', ->
    load 'config.dev.ini', ->
      delete module.exports.load if typeof module.exports.load is 'function'
      callback() if typeof callback is 'function'
