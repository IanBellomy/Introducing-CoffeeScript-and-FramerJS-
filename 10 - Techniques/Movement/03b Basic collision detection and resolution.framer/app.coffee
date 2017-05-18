###

	 See 'basic physics' first. 

	Basic physics simulations typically involve things bouncing off one another. This involves two problems: detecting overlap, and resolving the overlap, aka. "collision detection" and "collision resolution". These two problems exist in any physics simulation, but they get more and more complex the more complex the shapes are. 
	
On the simple end is a ball in a non-rotated box. (This example.) For fun, we've added gravity.

The basic idea is to 
1. update positions like normal.
2. Detection: Check to see if the ball location is beyond the bottom or sides.
3. Resolution? If so, move the ball back to the edge and flip its velocity (so xVelocity of 10 would become -10). As a little touch, we could also reduced the velocity to simulate a little loss of energy. 

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
	
	ball.y += ball.yVelocity
	ball.x += ball.xVelocity
	
	if ball.y > bottomBoundary
		ball.y = bottomBoundary
		ball.yVelocity *= -0.9
		
	if ball.x > rightBoundary
		ball.x = rightBoundary
		ball.xVelocity *= -0.9
		
	if ball.x < 0
		ball.x = 0
		ball.xVelocity *= -0.9
		
Framer.Device.screen.onMouseDown ->
	ball.yVelocity -= 10
	ball.xVelocity += Utils.randomNumber(-5,5)
	