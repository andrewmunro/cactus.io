require.config {
	paths: {
		'cactus.core': 'game/cactus',
		'jquery': 'lib/jquery'
		'pixi': 'lib/pixi'
	},
	shim: {
		#"cactus.core": [ "cactus.ie8" ]
	}
}

require ['cactus.core']