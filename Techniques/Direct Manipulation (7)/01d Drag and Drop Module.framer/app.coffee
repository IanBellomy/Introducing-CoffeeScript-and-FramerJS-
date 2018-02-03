###	

Creating drag and drop from scratch is beyond this course, but there is a pre-made solution that this example will cover.

The basic idea of drag and drop is that you can drag an item and that there is at least one other item that constitutes an acceptable "drop target". If you drag the item to the drop target and release, you've performed a 'drag and drop'. This actually involves a number of more specific events: mouse down, drag start, drag over, and drop. It can also include drag out and invalid drop events. 

To create drag and drop behavior we can use the Pair module. A module is a kind of add on that provides additional functions and classes. The file is placed in the module folder in the framer project folder. (It's already there in this case.)

To use the module, you import it with a line of code, and then can use the Pair class that exists in the module. 

When you create an instance of the Pair class you provide two layers: the layer that you want to be draggable and the layer you want to be a drop target. The pair instance will dispatch events that you can listen for and respond to.

If you want multiple targets, you can create multiple pairs instances.
	
###

# set some settings 
Framer.Defaults.Animation.time = 0.25
document.body.style.cursor = "default"

# create some boxes
box2 = new Layer
	size: 50
	borderColor:"grey"
	
box2.center()

box = new Layer
	size:50
	backgroundColor: "black"	
	x:50
	y:50
	
box.onMouseOver ->
	box.animate
		scale:1.2

box.onMouseOut ->	
	box.animate
		scale:1

# import the pair module
PairModule = require "Pair"

# create a Pair instance 
myPair = new PairModule.Pair(box,box2)

# turn on drag and drop
myPair.enableDragAndDrop()

# when we first move the cursor after having pressed on the draggable layer
myPair.onDragStart (dragged)->
	dragged.animate
		opacity:0.5
			
	box2.animate
		scale: 1

# when the cursor moves over the drop target while we drag
myPair.onDragOver (dragged,dropTarget)->	
	dropTarget.borderWidth = 5
	
# when the cursor leaves the drop target while we dragging
myPair.onDragOut (dragged,dropTarget)->	
	dropTarget.borderWidth = 0
	dropTarget.borderColor = "grey"
# when the mouse is released, after having dragged over a drop target
myPair.onDrop (dragged,dropTarget) ->
	dropTarget.animate
		borderColor:"limeGreen"
		scale:1.2
			
	dragged.animate
		midX:dropTarget.midX
		midY:dropTarget.midY
		scale:1
		opacity:1

# when the mouse is released, when not over a drop target
myPair.onInvalidDrop (dragged)->
	dragged.animate	
		opacity:1
		scale:1
				