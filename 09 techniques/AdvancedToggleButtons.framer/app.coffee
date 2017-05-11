#array of main layers
boxes = []

clickHandle = (event,layer)->
	# Because all the layers in the boxes array 
	# will have the same .nameLabel property 
	# I can loop through the array and modify
	# each one the same way
	for box in boxes
		box.opacity = 0.5
		box.nameLabel.opacity = 0.5
		
	# Once I set everything
	# I can set this layer to what I want
	# Overwriting what I just did in the loop above.
	@opacity = 1
	@nameLabel.opacity = 1


for n in [0...5]
	# The code below runs five times
	# Most of this you can do manually.
	b = new Layer
		height: 20
		y:n*22
		opacity: 0.5
		backgroundColor: "blue"
	
	l = new Layer
		height: 20
		y:n*22
		x:230
		width:10
		backgroundColor: "red"
		opacity: 0.5
	
	# nameLabel is a custom property I'm adding
	# I'm setting it equal to another layer
	b.nameLabel = l
	# Use the function I created earlier as an event handler
	b.onMouseDown clickHandle
	# Append the layer 'b' to the 
	boxes.push b
		
		

