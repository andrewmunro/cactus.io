bitcoin = require 'bitcoin'

client = new bitcoin.Client(
	host: 'localhost',
	port: 22555,
	user: 'doge',
	pass: 'wow'
)

exports.balance = (req, res) ->

	client.getBalance '*', 6, (err, bal) ->
		if err
			return console.error err
		data = 
			balance: bal

		res.send data