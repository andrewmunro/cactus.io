require.config {
	paths: {
		'cactus.core': 'client/Cactus',
		'cactus.gamemanager': 'client/GameManager',
		'cactus.chunkmanager': 'client/ChunkManager',
		'cactus.chunk': 'client/Chunk',
		'cactus.player': 'client/Player',
		'cactus.maprenderer': 'client/MapRenderer',

		'jquery': 'lib/jquery',
		'pixi': 'lib/pixi'
	}
}

require ['cactus.core']