###
	
	Introduction to: 

		• Framer Layers

	Preface:
	
		FramerJS is a library.
		It contains a useful building blocks for prototyping interactions.	
		Quite a bit of what's covered here is specific to FramerJS, opposed to programming in general, 
		but FramerJS uses techniques, patterns, idioms, or approaches that are similar to other 
		UI frameworks such as Apple's UIkit.

###

######################## P1
# Using Framer, we create and modify visuals by creating layer objects and setting their preoperties
# Framer takes care of making the visuals correspond to our layer data.

# Create two layers
box = new Layer()
box2 = new Layer()

# Layers can be positioned by setting their x and y properties.
box2.x = 100
box2.y = 200

# Note: The coordinate 0,0 is in the top left corner, 
# with y positive going down and x positive going right.

# Layers can be sized by setting their width and height properties.
box2.width = 50
box2.height = 200

# Layers have a backgroundColor property. 
# It can be set to a String that contains any valid CSS color value.
box.backgroundColor = "white"
box2.backgroundColor = "rgb(255,0,0)"

# Layer is a complex datatype or a kind of blueprint or symbol. 
# When we make new layers we make new instances of Layer

# A full list of Layer properties can be found in FramerJS's documentation (cmd+D)

# Technical Note:
# You might wonder, but how are we getting visuals from object data exactly???
# When we create a new Layer, FramerJS creates a DIV element in the document.
# FramerJS then uses inline CSS style properties to control what the DIV looks like.
# It uses absolute positioning so that we can ignore normal flow (the default way elements are placed).
# When we modify a layer's properties FramerJS updates the inline css.
# In MOST cases we will never need to directly access the div element or css. 
# If you need to, you CAN inject raw HTML by setting a layer's html property. 
#	e.g. 	myLayer.html = "<a href="google.com">Link</a>""


######################## P2
# We can set many of the layer instance's properties right when we 
# create it by passing an object with the settings we'd like.
# Here is the very explicit version:

box = new Layer({x:100,y:100,backgroundColor:"black",width:10,height:10})

# The object here is called an initialization object, because it's data is used
# to setup or initialize the layer we're creating.


######################## P3 [ Optional ]
# We can use a similar function shorthand when creating layers and omit the parenthesis.

box = new Layer {x:100,y:100,backgroundColor:"black",width:10,height:10}


######################## P4 [ Optional ]
# We can use object shorthand when creating layers

box = new Layer
	x:100
	y:100
	backgroundColor:"black"
	width:10
	height:10




