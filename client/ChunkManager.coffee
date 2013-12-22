define ["cactus.chunk", "jquery"], (Chunk, $)->
	class ChunkManager

		chunks = []

		constructor: (player) ->
			this.getMapChunk(player.x, player.y)


		getMapChunk: (mapChunkX, mapChunkY) ->
			url = "/mapdata/map_chunk_" + mapChunkX + "_" + mapChunkY + ".json"
			$.getJSON url, (data) ->
				chunks.push new Chunk(data)

