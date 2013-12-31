file_load = require './lib/file_load'

removable_loader = module.exports.load = ->
  # arguments
  config_files  = []
  fail_silently = true
  for arg in arguments
    switch typeof arg
      when 'boolean'  then fail_silently = arg
      when 'function' then callback      = arg
      when 'object'
        config_files = arg if arg.length and arg.push and arg.shift

  for arg in process.argv
    if arg.substr(0, 9) is '--config=' and arg.length > 9
      config_files.push arg.substr 9

  config_files.push 'config.ini' unless config_files.length

  next = ->
    if config_files.length
      return file_load module.exports, config_files.shift(), fail_silently, next

    delete module.exports.load if module.exports.load is removable_loader
    callback() if typeof callback is 'function'

  next()
