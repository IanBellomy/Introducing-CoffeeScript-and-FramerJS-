###

	 See 'basic physics' first. 

	Basic physics simulations typically invovle things bouncing off one another. This invovles two problems: detecting overlap, and resolving the overlap, aka. collision detection and resolution. These two problems exist in any physics simulation, but they get more and more complex the more complex the shapes are. The simplest collision detection and resolution is fairly easy, but complex collision detection and resolution can be very very very complex.

	Here is a rough hierarchy of 2D collision detection and resolution problems:

	A ball IN a box with vertical and parallel walls
	balls bouncing off other balls (as long as they are moving slower then the balls are wide)
	balls bouncing off non-rotated boxes (as long as they are moving slower than they are wide)
	balls bouncing off arbitrary lines (diagonals)	
	balls bouncing off arbitraryly rotated boxes
	boxes bouncing off rotated boxes (no rotation)	
	boxes bouncing off other boces (with rotations)
	Balls bouncing off arbitrary curves
	Balls bouncing off of arbitrary shapes
	Arbitrary shapes bouncing off of arbitrary shapes
	
Anything beyond the first three problems is beyond this course. 

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