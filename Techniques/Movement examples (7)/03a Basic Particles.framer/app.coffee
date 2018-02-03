###

	First Review: 
		• ArraysAndLoops 
		• Basic Physics
		
###

# We'll use this to get mouse events
bg = new Layer
	size: Screen.size
	backgroundColor: "skyblue"

# We'll need to keep track of our particles
particles = []

# When we click we'll add a new particle
bg.onMouseDown (e)->
	# Create a layer like normal
	p = new Layer
		width:5
		height:5
		x:e.offsetX
		y:e.offsetY
		backgroundColor: "white"
		
	p.xVelocity = Utils.randomNumber(-1,1)
	p.yVelocity = Utils.randomNumber(-1,1)			
	p.rVelocity = Utils.randomNumber(-4,4)
	
	# Add that layer to the array
	particles.push(p)

# Every refresh 
Framer.Loop.on "update", ->
	# for each particle
	for p in particles
		# Update its properties based on its velocities
		p.x += p.xVelocity
		p.y += p.yVelocity
		p.rotation += p.rVelocity
		