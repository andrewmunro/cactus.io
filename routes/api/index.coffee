router = require '../router'

module.exports =

	status: (req, res, next) ->
		router('ping', 'index', req, res, next)