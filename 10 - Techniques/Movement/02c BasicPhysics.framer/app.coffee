###

Basic physics

In short, it is where it is, plus its velocity.

###

bg = new Layer
	size: Screen.size
	backgroundColor: "skyblue"
bg.style.padding = "10px"	
bg.style.fontSize = "12px"


box = new Layer
	size:50
	backgroundColor: "white"	
box.center()

# We can describe any 2D movement in terms of the vertical rate of change and horizontal rate of change, aka. vertical velocity and horizontal "velocity" or x velocity and y velocity. We'll need to track these values ourselves.
box.xVelocity = 0
box.yVelocity = 0

# On click, we'll change the box's velocity
# The code at the bottom takes care of the rest
bg.onMouseDown ->	
	box.xVelocity = Utils.randomNumber(-2,2)
	box.yVelocity = Utils.randomNumber(-2,2)
	
	# Just displaying the velocity values
	bg.html = "xVelocity: "+box.xVelocity + "<br>yVelocity: " + box.yVelocity

Framer.Loop.on "update", ->
	# This is the meat of the 'physics simulation'
	# We change a value by its rate of change, aka. 
	# Change a value by its velocity.
	box.x += box.xVelocity 
	box.y += box.yVelocity
	# That's it!