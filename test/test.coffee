config = require '../coffee/config-ini'

console.log 'Usage: coffee test.coffee [--config=your-config.ini]'

config.load (err) ->
  if err
    console.log 'ERROR:', err, config
  else
    console.log 'loaded:', config
