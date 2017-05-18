###

	(see Basic Custom Drag first)
	
	Here we avoid having the box snap to the cursor. 

###

box = new Layer
	backgroundColor: "black"

isBeingDragged = false 
dragOffset = {x:0,y:0}

box.onMouseDown (e)->
	isBeingDragged = true	
	
	dragOffset.x = e.offsetX
	dragOffset.y = e.offsetY

box.onMouseUp ->
	isBeingDragged = false

Framer.Device.screen.onMouseMove (e)->		
	if isBeingDragged				
		box.x = e.pageX - dragOffset.x
		box.y = e.pageY - dragOffset.y
	