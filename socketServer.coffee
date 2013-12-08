io = require 'socket.io'
cookie = require "cookie"
connect = require "connect"

module.exports = (server) ->
	io = io.listen(server)

	io.set 'authorization', (handshakeData, accept) ->

		if handshakeData.headers.cookie
			handshakeData.cookie = cookie.parse(handshakeData.headers.cookie)
			handshakeData.sessionID = connect.utils.parseSignedCookie(handshakeData.cookie['express.sid'], 'secret')

			if handshakeData.cookie['express.sid'] == handshakeData.sessionID 
				return accept('Cookie is invalid.', false)
			else 
				return accept('No cookie transmitted.', false)

		return accept(null, true)