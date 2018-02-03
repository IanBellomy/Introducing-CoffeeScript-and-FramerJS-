###

Instead of relying on the Layer's built in dragging,
we can repond to mouse move events on the whole canvas and update any value we want based on the mouse position.

###

box = new Layer
	backgroundColor: "black"	

Framer.Device.screen.onMouseMove (e)->
	box.midX = e.pageX
	box.midY = e.pageY
	box.width = e.pageX
	box.rotation = e.pageY
	box.opacity = e.pageX / Screen.width