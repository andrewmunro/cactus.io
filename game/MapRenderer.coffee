define ["pixi", "jquery"], (PIXI, $)->
	class MapRenderer

		constructor: ->

		getMapChunk: (mapChunkX, mapChunkY) ->
			url = "/mapdata/map_chunk_" + mapChunkX + "_" + mapChunkY
			return $.getJSON url, (data) ->
				return new MapChunk(data)

		