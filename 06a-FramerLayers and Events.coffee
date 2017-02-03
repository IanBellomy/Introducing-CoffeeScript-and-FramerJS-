###
	
	Introduction: 

		• Layers and Events

	FramerJS is a library.
	It contains a useful collection of classes and functions for doing UI prototyping.
	At this point we step away from programming concepts to application.
	While a lot of what's covered below is specific to FramerJS, 
	FramerJS shares common patterns, idioms, or approaches that are similar to other UI approaches. 

###

######################## P1
# Layers are a powerful class for making visuals that FramerJS provides.
# Layer instances have properties like x, y, width, height, backgroundColor, etc.
# When we set of modify these properties, the visuals change automatically. 

# We create new layers like this.
layer1 = new Layer
layer2 = new Layer


# Layers can be positioned by setting their x and y properties.
layer2.x = 100
layer2.y = 200
# Note: 0,0 is in the top left corner, with y positive going down and x positive going right

# Layers can be sized by setting their width and height properties.
layer2.width = 50
layer2.height = 200

# Layers have a backgroundColor property. 
# It can be set to a String that contains any valid CSS color value.
layer1.backgroundColor = "white"
layer2.backgroundColor = "rgb(255,0,0)"

# A full list of Layer properties can be found in FramerJS's documentation (cmd+D)

# Technical Note:
# When we create a Layer, FramerJS creates a DIV element in the document.
# FramerJS then uses inline css style properties to control what the DIV looks like.
# It uses absolute positioning so that we can ignore normal flow (the default way elements are placed)
# When we modify a layer's properties, FramerJS updates the inline styles.
# In MOST cases we will never need to act on the underlying element. 
# We can work with the layer just like we'd work with similar objects in similar frameworks.


######################## P2
# We can set many of the layer's properties right when we 
# create it by passing an object with the settings we'd like

layer1 = new Layer({x:100,y:100,backgroundColor:"black",width:10,height:10})

# It is very common to use shorthand when constructing a layer in this way.
# For example:
layer2 = new Layer
	x:10
	y:100
	backgroundColor:"orange"
	width:20
	height:20


######################## P3
# Layer's can be nested.
# Sublayers are positioned based on the top left of the parent layer.

container = new Layer
	x:50
	y:50
	width:100
	height:100
	backgroundColor: "black"

sublayer = new Layer	
	x:10
	y:10
	backgroundColor:"red"
	opacity:0.5 # Note: opacity goes between 0 and 1

sublayer.parent = container 	# Note that l2 is at x:10,y:10 based on the parent coordinates
								# Note that container's background color doesn't affect l2
								# Note that l2 is visually on top of l1's background color

print container.height			# Note that the container's height is not affected by sublayers.			

# container.clip = true			# Uncomment this line and watch how the sublayer is clipped to the container's size.


######################## 
######################## (Layer) Events
######################## 

###
	
	User interface development is all about running code when something happens.
	Most systems respond to input by "generating events" and/or by calling a function 
	that the programmer has marked to "handle" the event. 
		
	Most systems will generate events when:
		
		a mouse button is pressed down or released		
		a keyboard button is pressed down or released		
		the internal clock updates

	User interface frameworks will provide more specific for things like:

		when a cursor moves over or off of a UI element		
		when a mouse button is pressed or released while the cursor is over a UI element
	
	FramerJS's Layers ar no different.

###


######################## P4
# Layers "generate events" when something like a click happens.
# We write code the responds to these events.
# Specifically we "add" functions that "listen" for these events. 
# Sometimes this is called "binding" — it's like we're connecting things together. 
# Functions that are used to respond to events are called "even handlers" or "handlers"
# This term refers to how the programmer is _using_ the function. 
# By all other accounts an event handler is just a plain old function.

block = new Layer

# Create the handler function
handleMouseDown = ->
	print("Ouch!")

# To "add an event handler" to a layer we use one of the layer's event binding methods.
# These methods correspond to a kind of event, and accept one argument, the handler function.
# Here we call the method 'onMouseDown' with the argument 'handleMouseDown'
block.onMouseDown(handleMouseDown)

# Under the hood, FramerJS notes that the 'handleMouseDown' function should be called 
# when it detects a mouse press while the cursor is over the 'block' layer.


######################## P5
# We can create an add event handlers in one step by using a function literal
# This shortens things up a bit.

block = new Layer
block.onMouseDown( -> print("Ow!") )	

# We can shorten things further by using function call shortcuts
block.onMouseUp -> print "Whew" 		

# We can also use function literals with multiple lines
block.onMouseOver -> 
	print "?" 		# Note the indentation
	print "!" 		
	print "?" 		

# This approach is very common in FramerJS. 
# It's very very brief, but it can be ambiguous if you don't undersatnd that:
# 'onMouseOver' is a "method" being "called" with an "argument" which happens to be a "function literal"


######################## P6
# When a handler function is called, in the function, the keyword 'this' will refer to the Layer that generated the event. 
# Same goes for the '@' shortcut.
# This makes it easy to refer to the object that was acted on.

block = new Layer
	backgroundColor:"black"

block.onMouseDown ->
	@backgroundColor = "red"

block.onMouseUp ->
	@backgroundColor = "black"


######################## P7
# This program creates a button-like entity that responds to the mouse in several ways.

block = new Layer
	backgroundColor:"grey"

block.onMouseOver ->
	@backgroundColor = "orange"

block.onMouseOut ->
	@backgroundColor = "grey"

block.onMouseDown ->
	@backgroundColor = "red"

block.onMouseUp ->
	@backgroundColor = "orange"


######################## P8
# When an event handler is called, the computer tries to give it an "Event Object"
# This object has many properties that provide information about what happened.
# To access this object, our handler must accept one argument.
# Some of the mose valuable information is information about the cursor location.

block = new Layer
	x:100

# The explicit way
downHandler = (eventObject)->
	print "down"
	print eventObject.offsetX 	# the x location of the cursor in the layer 
	print eventObject.offsetY 	# the y location of the cursor in the layer

block.onMouseDown(downHandler)

# A shorter way of doing the same thing.
block.onMouseUp (eventObject)->
	print "up"
	print eventObject.offsetX
	print eventObject.offsetY


######################## P9
# In this next example, we want to listen to events on the background.
# We can just create a layer that is the size of the screen.

bg = new Layer
	width:Screen.width
	height:Screen.height
	backgroundColor:"skyblue"

box = new Layer
	width:10
	height:10
	backgroundColor:"white"

bg.onMouseDown (e)->
	box.midX = e.offsetX
	box.midY = e.offsetY	


######################## 
######################## End
######################## 
