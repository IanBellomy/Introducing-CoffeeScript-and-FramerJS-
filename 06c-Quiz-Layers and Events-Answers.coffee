###

	Quiz-Layers and Events
	
###

######################################## Q1
# Create three blue layers, 'a' 'b' and 'c' that are each 50 x 50

a = new Layer 
	x:50
	y:50
	color:"#0000ff"

b = new Layer {x:50,y:50,color:"#0000ff"}
c = new Layer({x:50,y:50,color:"blue"})	


######################################## Q2
# Create a three layers 'a' 'b' and 'c'.
# Use 'a' as a parent for 'b' and 'c'

a = new Layer 	

b = new Layer 	# ok
	parent: a

c = new Layer 	# also ok
c.parent = a



######################################## Q3
# Create a red layer that's the size of the screen

l = new Layer
	backgroundColor:"red"
	width:Screen.width
	height:Screen.height


# also ok. Technically questions does not say to assign the layer to a variable.

new Layer
	backgroundColor:"red"
	width:Screen.width
	height:Screen.height



######################################## Q4
# Create an orange layer that turns red when the cursor enters and orange when it leaves

l = new Layer
	backgroundColor:"orange"

l.onMouseOver -> @backgroundColor = "red"
l.onMouseOut -> @backgroundColor = "orange"


######################################## Q5
# Create a layer that becomes 10px larger when clicked.

l = new Layer	
l.onMouseDown -> 				# onMouseDown or onClick are also ok.
	@width = @width + 10 		
	@height = @height + 10


######################################## Q6
# Create a layer the size of the screen
# When you click this layer, another layer is created 
# and placed so that it's top left is where you clicked. 

l = new Layer
	width:Screen.width
	height:Screen.height

l.onMouseDown (e)->				# onMouseUp or onClick are also ok.
	new Layer
		x:e.offsetX
		y:e.offsetY

