###
	
Brownian motion
	
	aka. random jitter
	aka. wiggle
	aka. noise
	
	
Every update, change the value just a little by asdfa random ammount.
	

###

box = new Layer
	size:50
	backgroundColor: "black"
	opacity: 0.5

box.center()

Framer.Loop.on "update", ->
	
	box.x += Utils.randomNumber(-2,2) # create a random number between -2 and 2.
	box.y += Utils.randomNumber(-2,2) # etc.
	box.rotation += Utils.randomNumber(-2,2)
	box.opacity += Utils.randomNumber(-0.01,0.01)
	box.scale += Utils.randomNumber(-0.01,0.01)
	