define ["cactus.player", "cactus.chunkmanager", "cactus.maprenderer"], (Player, ChunkManager, MapRenderer)->
	class GameManager

		constructor: () ->

			player = new Player()

			chunkManager = new ChunkManager(player)

			mapRenderer = new MapRenderer(chunkManager)
		