###
	
	FramerJS introduction: Layers and Events

	— Ian Bellomy, 2016

###

######################## P
# Layers are powerful class defined in the FramerJS library.
# When created, the underlying FramerJS framework takes care of presenting them on screen.

# We create new layers like this.
layer1 = new Layer
layer2 = new Layer

# Layers can be positioned by setting their x and y properties.
# Behind the scenes, the FramerJS framework takes care of updating the visuals.
layer2.x = 200
layer2.y = 200

# Layers have a backgroundColor property. 
# It can be set to a String that contains any valid CSS color value.
# Again, the framework will take care of updating the visuals. 
layer1.backgroundColor = "white"
layer2.backgroundColor = "rgb(255,0,0)"



######################## P
# Layers generate events.
# We "add" functions that "listen" for these events. 
# In other words, we create functions and tell the framework to call these functions when something specific happens.
# This is a very common pattern for interface development. 

block = new Layer
	backgroundColor:"grey"


# Define an event handler function...
hover = -> 
	block.backgroundColor = "black"
	

# To "add" an event handler, we use the Layer's on(eventName,handlerFunction) method.
# This method accepts two arguments, a String with the name of the event, and a function to call when the event happens.
block.on "mouseover", hover

# For the handlerFunction argument, we can write a function literal instead of using a variable.
block.on "mouseout", -> block.backgroundColor = "grey"

# When an event handler is called, the keyword 'this' will refer to the Layer that generated the event. 
# Using the 'this' keyword is more common than refering to the layer explicitly.
block.on "mousedown", -> this.backgroundColor = "red"

# In CoffeeScript, we can use the shortcut '@' in place of 'this.'  
block.on "mouseup", -> @backgroundColor = "black"
# This last example uses all the shorthand techniques in CoffeeScript. It is a common approach to creating event handlers using FramerJS.
# Try re-writing the other handlers to match this structure.  


######################## P
# In this next example, it would be nice to add a mouse event listener to the screen, but this is not possible.
# Instead, we can create a BackgroundLayer to catch mouse events.
# A BackgroundLayer is a kind of layer that always fills the viewing area and is always in the back.
backLayer = new BackgroundLayer
	backgroundColor: "skyblue"

box = new Layer
	width: 100
	height: 100
	backgroundColor: "white"

# When FramerJS calls an event handler, it attempts to pass it an event object (that has information about the event)
# When we specify an event handler function, we don't have to accept this argument, but we can if we want it. 
backLayer.on "mousedown", (event)->
	box.midX = event.clientX 	# A mouse event of any kind will include information about the mouse location.
	box.midY = event.clientY	# clientX and clientY is the x and y location of the cursor in the main viewing area. 
								# Layer.midX and Layer.midY are the cooridnates of the middle of the layer.



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



