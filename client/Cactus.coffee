define ["cactus.gamemanager", "pixi"], (GameManager, PIXI)->

	gamemanager = new GameManager()

	width = 1024
	height = 678

	stage = new PIXI.Stage(0x66FF99)
	renderer = PIXI.autoDetectRenderer(width, height)
	document.body.appendChild(renderer.view)

	graphics = new PIXI.Graphics()
	stage.addChild(graphics)

	isoTile = (backgroundColor, borderColor, w, h) ->
		halfHeight = h / 2
		(x,y) ->
			graphics.beginFill(backgroundColor);
			graphics.lineStyle(1, borderColor, 1);
			graphics.moveTo(x, y);
			graphics.lineTo(x + w, y + halfHeight);
			graphics.lineTo(x, y + h);
			graphics.lineTo(x - w, y + halfHeight);
			graphics.lineTo(x, y);
			graphics.endFill();

	G = 0
	D = 1
	W = 2
	X = 3

	terrain = [
	  [G, G, G, G],
	  [D, D, X, D],
	  [D, G, X, W],
	  [D, G, W, W],
	  [G, G, W, W],
	]

	tileHeight = 60
	tileWidth = 60

	grass = isoTile(0x80CF5A, 0x339900, tileWidth, tileHeight)
	dirt = isoTile(0x96712F, 0x403014, tileWidth, tileHeight)
	water = isoTile(0x85b9bb, 0x476263, tileWidth, tileHeight)
	empty = () ->
	tileMethods = [grass, dirt, water, empty]

	drawMap = (terrain, xOffset) ->

		for i in [0...terrain.length]
			for j in [0...terrain[i].length]
				x = j * tileWidth
				y = i * tileHeight
				isoX = x - y
				isoY = (x + y) / 2

				tileType = terrain[i][j]
				drawTile = tileMethods[tileType]
				drawTile(xOffset + isoX, isoY)

	drawMap(terrain, width / 2)

	animate = () ->
		requestAnimFrame( animate )
		renderer.render(stage)

	requestAnimFrame( animate )