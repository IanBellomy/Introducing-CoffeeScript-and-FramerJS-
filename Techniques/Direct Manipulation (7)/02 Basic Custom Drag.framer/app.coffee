###

In most cases, Framer's built in dragging should be fine.
In a pinch though, it may be useful to know how to build something similar from scratch.
The basic idea is that we update the position on mouse move, but only if we know we shold be dragging. We know this by using a variable and turning it on and off when we click and release. 

###

box = new Layer
	backgroundColor: "black"

isBeingDragged = false

box.onMouseDown ->
	isBeingDragged = true

box.onMouseUp ->
	isBeingDragged = false

Framer.Device.screen.onMouseMove (e)->		
	if isBeingDragged		
		box.midX = e.pageX
		box.midY = e.pageY	
	