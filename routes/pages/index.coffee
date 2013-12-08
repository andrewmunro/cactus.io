router = require '../router'

module.exports =

    index: (req, res, next) ->
        router('index', 'index', req, res, next)

    privatepage: (req, res, next) ->
        router('private', 'index', req, res, next)

    controller: (req, res, next) ->
        router(req.params.controller, req.params.method, req, res, next)

    failure: (req, res, next) ->
        router('failure', 'index', req, res, next)