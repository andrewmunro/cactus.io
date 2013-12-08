express = require 'express'
http = require 'http'
mongoose = require 'mongoose'

app = express()
app.port = process.env.PORT or process.env.VMC_APP_PORT or 8080
console.log('Express running on port ' + app.port)
config = require "./config"

app.configure 'production', 'development', 'testing', ->
  config.setEnvironment app.settings.env

if app.settings.env != 'production'
  mongoose.connect 'mongodb://localhost/database'
else
  console.log('If you are running in production, you may want to modify the mongoose connect path')

# Set the public folder as static assets.
app.use express.static('./public')
app.use express.static('./bin')

store = new express.session.MemoryStore
app.use express.cookieParser()
app.use express.session(
  secret: 'secret'
  store: store
)

app.set 'view engine', 'jade'
app.set 'views', './public/views'

app.use express.urlencoded()
app.use express.json()

routes = require './routes'
routes(app)

server = http.createServer(app)
server.listen(3000)

socketServer = require './socketServer'

socketServer(server)

# Export application object
module.exports = app