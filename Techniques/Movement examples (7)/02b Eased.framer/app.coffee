###
	
'Eased' or 'Rubber-banded' (not to be confused with the "easing" functions of a triggered animation.)
	
The skeptic philosopher Zeno had a paradox: If a moving object had to go halfway before it reachead its destination and it still had to go halfway yet again and halfway yet again, how does it ever reach its destination?

Things don't move like that in real life of course (only ever moving half way); but they can in a program...

This is the idea behind a kind of 'eased' movement — a value (say x) gets closer to a target value but never all the way there, giving the appearence of a fast change that quickly slows down. As a bonus, the 'goal value' of can continually change. For example, we can use the eased movement technique to have an item follow the cursor in a kind of rubber-bandy way that gives the object a sense of weight. 

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
	