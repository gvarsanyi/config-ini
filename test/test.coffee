config = require '../coffee/config-ini'

console.log 'Usage: coffee test.coffee [--config=your-config.ini]'
console.log 'Loading specified config files'
config.load ->
  console.log 'Config instance:', config
