define [], ()->
	class Chunk

		constructor: (chunkData) ->

			this.data = chunkData

			loadChunkData()

		loadChunkData: ->
			this.height = data.height
			this.width = data.width
			this.layerData = data.layers[0]
			this.tileWidth = data.tileWidth
			this.tileHeight = data.tileHeight
			this.tileset = data.tilesets[0].image



