###
	
Eased
	
The skeptic philosopher Zeno had a paradox: If a moving object had to go halfway before it reachead its destination, and it still had to go halfway yet again, and halfway yet again, how does it ever reach its destination?

Things don't move like that; but they could...

###

easeAmount = 15

mouseX = 0
mouseY = 0

Framer.Device.screen.onMouseMove (e)->
	mouseX = e.offsetX
	mouseY = e.offsetY	

box = new Layer
	size:50
	backgroundColor: "black"
	opacity: 0.5

Framer.Loop.on "update", ->
	###
	First. we find the difference between where
	the a value is, and where we want it to be. 
	In this case, the difference between the box's x and y
	properties and the mouseX and mouseY properties. 
	###
	xDistance = mouseX - box.midX
	yDistance = mouseY - box.midY
	
	###
	If we added these differences to the x and y values, the 
	box would move by exactly that amount, and be directly 
	on top of the cursor. 
	
	However, if we divide these distances and add THAT 
	number, the box will only go part way there, getting 
	closer each time but never exactly. 
	###
	box.midX += xDistance / easeAmount
	box.midY += yDistance / easeAmount
	