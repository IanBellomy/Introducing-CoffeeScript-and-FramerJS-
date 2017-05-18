###

Making one thing point at another is just some math..
Find the angle between the pointer and the pointed at, then change the rotation of the pointer to be that angle.

###

lineBlock = new Layer
	height: 20
	width: 100
	originX: 0	# the later will rotate around a point along it's left side, halfway down.
	backgroundColor: "black"
	
lineBlock.x = Screen.midX
lineBlock.y = Screen.midY


Framer.Device.screen.onMouseMove (e)->
	# Here we calculate the angle between the layer and the cursor
	angleRadians = Math.atan2(e.pageY - lineBlock.y, e.pageX - lineBlock.x)
	
	# The result of Math.atan2 is in PI radians, but Layer rotation is in degrees
	# So we convert to the number above to degrees
	angleDegrees = angleRadians/Math.PI * 180
	
	# Now we set the rotation
	lineBlock.rotation = angleDegrees