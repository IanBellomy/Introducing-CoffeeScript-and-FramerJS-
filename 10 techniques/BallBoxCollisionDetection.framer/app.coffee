
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

# Framer.Loop.on "update", ->
# 	ball.yVelocity += gravity
# 	
# 	ball.y += ball.yVelocity
# 	ball.x += ball.xVelocity
# 	
# 	if ball.y > bottomBoundary
# 		ball.y = bottomBoundary
# 		ball.yVelocity *= -0.9
# 		
# 	if ball.x > rightBoundary
# 		ball.x = rightBoundary
# 		ball.xVelocity *= -0.9
# 		
# 	if ball.x < 0
# 		ball.x = 0
# 		ball.xVelocity *= -0.9
		
Framer.Device.screen.onMouseDown ->
	ball.yVelocity -= 10
	ball.xVelocity += Utils.randomNumber(-5,5)
	
Framer.Device.screen.onMouseMove (e)->
	box.midX = e.offsetX