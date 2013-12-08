module.exports = (controllerName, methodName, req, res, next) ->
	controllerName = 'index' if not controllerName?
	controller = null
	try
		controller = require "../controllers/" + controllerName
	catch e
		console.warn "controller not found: " + controllerName, e
		next()
		return
	data = null
	if typeof controller[methodName] is 'function'
		actionMethod = controller[methodName].bind controller
		actionMethod req, res, next
	else
		console.warn 'method not found: ' + methodName
		next()