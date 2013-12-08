exports.index = (req, res) ->
	console.warn "error 404: ", req.url
	res.statusCode = 404
	res.render '404', 404