bg = new Layer
	size: Screen.size
	backgroundColor: "skyblue"
bg.style.padding = "10px"	
bg.style.fontSize = "12px"


box = new Layer
	size:50
	backgroundColor: "white"	
box.center()

# Movement in space happens on two axis, x and y.
# So we can describe any 2D movement in terms of the vertical rate of change and the horizontal rate of change, aka. veritcal velocity or horizontal velocity, aka. x velocity and y velocity.
# In computer terms we create custom properties for these two values: xVelocity and yVelocity
box.xVelocity = 0
box.yVelocity = 0

# On click, we'll change the box's velocity
# The simulation code at the bottom takes care of the actual movement we see
bg.onMouseDown ->	
	box.xVelocity = Utils.randomNumber(-2,2)
	box.yVelocity = Utils.randomNumber(-2,2)
	
	# Just displaying the velocity values
	bg.html = "xVelocity: "+box.xVelocity + "<br>yVelocity: " + box.yVelocity

# Here we add a handler function to Framer's main update loop.
# The Loop is not a layer, it is a process that runs before every screen update (roughly 60 times a second). If we modify something every update, it looks like it's changing continuously. Think of it like a relly fast flipbook.
Framer.Loop.on "update", ->
	# This is the meat of the 'physics simulation'
	# Change a value by its rate of change, aka. 
	# Change a value by its velocity.
	box.x += box.xVelocity 
	box.y += box.yVelocity
	# That's it!