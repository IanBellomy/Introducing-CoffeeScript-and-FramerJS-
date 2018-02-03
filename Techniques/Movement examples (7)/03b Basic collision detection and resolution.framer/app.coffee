###

	 See 'Basic Physics' first. 

	Basic physics simulations typically involve things bouncing off one another. This involves two problems: detecting overlap, and resolving the overlap, or "collision detection" and "collision resolution". These two problems exist in any physics simulation, but they get more complex the more complex the shapes are. On the simple end is a ball in a (non-rotated) box. (This example.) For fun, we've added gravity. 

	The general approach is to
	
		1. Update positions like normal.
		2. Check to see if the ball location is beyond the bottom or sides (Collision Detection)
		3. If a collision is detected, move the ball back to the edge and flip its velocity (so xVelocity of 10 would become -10). As a little touch, we could also reduced the velocity to simulate a little loss of energy. (Collision Resolution)

###


ball = new Layer
	width: 20
	height:20
	borderRadius: 20
	backgroundColor: "red"
	x:Align.center
	y:Align.center
	
ball.xVelocity = Utils.randomNumber(-5,5)
ball.yVelocity = 0

gravity = 1

bottomBoundary = Screen.height - ball.height
rightBoundary = Screen.width - ball.width

Framer.Loop.on "update", ->
	
	# gravity is an acceleration
	# it modifies something's vertical velocity
	ball.yVelocity += gravity
	
	# the ball's movement is still determined by its velocity
	ball.y += ball.yVelocity
	ball.x += ball.xVelocity
	
	# detection
	if ball.y > bottomBoundary
		# resolution
		ball.y = bottomBoundary
		ball.yVelocity *= -0.9
	
	# detection
	if ball.x > rightBoundary
		# resolution
		ball.x = rightBoundary
		ball.xVelocity *= -0.9
	
	# detection
	if ball.x < 0
		# resolution
		ball.x = 0
		ball.xVelocity *= -0.9
		
Framer.Device.screen.onMouseDown ->
	ball.yVelocity -= 10
	ball.xVelocity += Utils.randomNumber(-5,5)
	