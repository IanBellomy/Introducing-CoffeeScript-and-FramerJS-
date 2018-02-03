###

Framer layers have a built in dragging capability. So making them draggable is very easy.
	
We can also listen for drag events to update other things in response to a change. This allows us to use a draggable box is to control other things.

###

dragBox = new Layer
dragBox.draggable.enabled = true

blueBox = new Layer
	backgroundColor: "skyBlue"
	size:0

update = ->
	blueBox.width = dragBox.x
	blueBox.height = dragBox.y
	
# Ehen we drag the box
dragBox.onDragMove(update)

# Ehen the box moves after having been dragged
dragBox.onMove(update)