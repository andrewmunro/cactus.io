define ["jquery", "pixi"], ($, PIXI)->

	stage = new PIXI.Stage(0x66FF99)

	renderer = PIXI.autoDetectRenderer(1024, 678)

	document.body.appendChild(renderer.view)

	animate = () ->
		requestAnimFrame( animate );
		bunny.rotation += 0.05
		renderer.render(stage)

	texture = PIXI.Texture.fromImage("img/moleman.png")
	bunny = new PIXI.Sprite(texture)
	 
	bunny.anchor.x = 0.5
	bunny.anchor.y = 0.5

	bunny.position.x = 512
	bunny.position.y = 339

	blurFilter = new PIXI.BlurFilter()
	bunny.filters = [blurFilter]

	stage.addChild(bunny)

	requestAnimFrame( animate )