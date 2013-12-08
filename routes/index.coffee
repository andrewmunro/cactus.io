pages = require './pages'
api = require './api'
path = require 'path'

module.exports = (app) ->

	checkAuth = (req, res, next) ->
		unless req.session.authorized
			res.statusCode = 401
			res.render '401', 401
		else
			next()

	app.get '/private', checkAuth, pages.privatepage

	app.get '/', pages.index

	app.get '/:controller', pages.controller

	app.get '/:controller/:method', pages.controller

	app.get '/:controller/:method/:id', pages.controller

	app.get '/status', api.status

	app.get '/cactus.js', (req, res, next) ->
		console.log process.cwd()
		res.sendfile path.resolve '../cactus.js'

	app.get '/*', pages.failure