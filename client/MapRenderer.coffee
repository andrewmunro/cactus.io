define ["pixi"], (PIXI, $)->
	class MapRenderer

		constructor: (chunkManager) ->
			this.chunkManager = chunkManager

			width = 1024
			height = 678

			this.stage = new PIXI.Stage(0x66FF99)
			renderer = PIXI.autoDetectRenderer(width, height)
			document.body.appendChild(renderer.view)

			graphics = new PIXI.Graphics()
			this.stage.addChild(graphics)

		drawMap: (chunk) ->

			data = chunk.layerData.data
			for index in [0...data.length]
				row = index % layerData.height
				col = index % layerData.width
				x = col * chunk.tileWidth
				y = row * chunk.tileHeight
				isoX = x - y
				isoY = (x + y) / 2

				tileType = data[index]
				drawTile = tileMethods[tileType]
				drawTile(xOffset + isoX, isoY)

		