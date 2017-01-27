###
	
	FramerJS introduction: 

		• Layers and Events

	— Ian Bellomy, 2016

###

######################## P
# Layers are a powerful class provided by the FramerJS library.
# When we create a Layer, the framework takes care of presenting visuals on the screen.

# We create new layers like this.
layer1 = new Layer
layer2 = new Layer

# Layers can be positioned by setting their x and y properties.
layer2.x = 200
layer2.y = 200
# Under the hood, the framework takes care of updating the visuals.

# Layers have a backgroundColor property. 
# It can be set to a String that contains any valid CSS color value.
# Again, the framework will take care of updating the visuals. 
layer1.backgroundColor = "white"
layer2.backgroundColor = "rgb(255,0,0)"

# Technical note:
# The magic works like this
# When you create a layer, the Framer framework creates a Div element in the document.
# Framer uses inline css style properties to control what it looks like.
# When you modify the layer's properties, Framer modifies the inline style.


######################## P
# Layers "generate events" when something like a click happens.
# We write code the responds to these events.
# Specifically we "add" functions that "listen" for these events. 
# Functions that are used to respond to events are called "even handlers" or "handlers"
# This term refers to how the progammer is _using_ the function. 
# By all other accounts it is just a plain old function.
# This "event handling" pattern is a VERY common pattern in interface development. 

block = new Layer

# Create the handler function
handleMouseDown = ->
	print("Ouch!")

# Here we "call" the "method" 'onMouseDown' with the "argument" 'handleMouseDown'
block.onMouseDown(handleMouseDown)

# Under the hood, Framer notes that the 'handleMouseDown' function should be called 
# when it detects a mouse press on the block layer.
# You can think of this as connecting the event to the handler. 
# This pattern is described as "adding an event listener".


######################## P
# We can create an add event handlers with function literals
# This shortens things up a bit.

block = new Layer

block.onMouseDown ->
	print("Yikes!")

# Because we're calling the 'onMouseDown' method with an argument, we can omit the parenthesis

######################## P
# When an handler function is called, the keyword 'this' will refer to the Layer that generated the event. 
# This makes it easy to refer to the object that was acted on.

block = new Layer
	backgroundColor:"black"

block.onMouseDown ->
	@backgroundColor = "red"

block.onMouseUp ->
	@backgroundColor = "black"


######################## P
# This example creates a button-like entity that responds to the mouse in several ways.

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


######################## P
# When an event handler is called, it is given an Event Object
# This object is dense and has lots of information about the event, like where it happened

block = new Layer

block.onMouseDown (eventData)->
	print eventData.offsetX + "," + eventData.offsetY	

######################## P
# In this next example, we want to listen to events on the background
# We can just create a layer that is the size of the screen.

bg = new Layer
	width:Screen.width
	height:Screen.height
	backgroundColor:"skyblue"

box = new Layer
	width:10
	height:10
	backgroundColor:"white"

bg.onMouseDown (eventData)->
	box.midX = eventData.offsetX
	box.midY = eventData.offsetY	



######################## P
# It's not uncommon for a function to use a String for an important detail.
# However, this can create a problem.
# If the String has a typo, for example, "mousdown", your event will never be called and there will be no error. 
# The program will run, but will not work as expected, and you'll have no indication as to why.
# To get around this, it is common practice to create variables that hold onto these words. 
# If you misstype the variable, an error will occur at that specific place in the code, and you will be notified. 
# This is preferable to the program failing silently. 
# Personally, I tend to flip back and forth because: 
# 1. The autocomplete features for CoffeeScript Editors aren't that good really... 
# 2. The more you type, the more chance of a mistake in the first palce.
# 3. Really, this idea works best with enums, a structure that JavaScript/CoffeeScript doesn't support. 


# Properties that store strings: 
print Events.MouseOver
print Events.MouseOut
print Events.MouseDown
print Events.MouseUp
print Events.DoubleClick

layerA = new Layer

layerA.on "mousdown", ->		# Typo, but no error. 
	@x = 50

layerA.on Events.MousUp, ->		# Typo, with a potentially time saving error message. 
	@y = 50



