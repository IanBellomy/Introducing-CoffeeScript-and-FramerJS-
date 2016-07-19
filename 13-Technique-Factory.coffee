###
	
		Factories:
		How to create multiple copies of a complex object.

###

######################## P
# A "factory" function is a function that returns an object.
# This is handy for consolidating object creation code that you'll use repeatedly.
# Here's a simple example.

makeThing = ->		# Here's the factory function
	return {type:"Thing",cost:100,fireproof:true}	# the object the function will return

t1 = makeThing()	# This becomes  t1 = {type:"Thing",cost:100,fireproof:true}
t2 = makeThing()	# ...and so forth
t3 = makeThing()
t4 = makeThing()

print t1
print t2
print t3
print t4

######################## P
# Here's a practical example where our factory function returns a layer with pre-made behaviors
# Note that we're adding event handlers inside the factory function.
# Note that we return the button layer in the last line. 

makeButton = ->
	button = new Layer	
		width:100
		height:100
		backgroundColor: "black"
		
	button.onMouseOver ->
		@backgroundColor = "gray"
		
	button.onMouseOut ->
		@backgroundColor = "black"
		
	return button


b1 = makeButton()
b2 = makeButton()
b2.y = 101
b3 = makeButton()
b2.y = 202

######################## P
# We can write our factory function to accept configuration data.

makeButton = (startY)->
	button = new Layer	
		width:50
		height:50
		y:startY
		backgroundColor: "black"
		
	button.onMouseOver ->
		@backgroundColor = "gray"
		
	button.onMouseOut ->
		@backgroundColor = "black"
		
	return button


b1 = makeButton()
b2 = makeButton(101)

######################## P
# When making a factory that produces layers, it can be useful if the factory accepts an entire options object.

makeButton = (options)->
	
	options.backgroundColor = "black"		# Maybe your factory doesn't allow every configuration option.
											# Maybe your factory forces some properties to be a specific value.
											# "You can have any color of button you'd like, as long as it's black." —Henry Ford, FramerJS enthusiast.

	button = new Layer(options)			
		
	button.onMouseOver ->
		@backgroundColor = "gray"
		
	button.onMouseOut ->
		@backgroundColor = "black"
		
	return button


b1 = makeButton	
	x:200
	
b2 = makeButton
	x:200
	y:201
	borderRadius:100

b3 = makeButton
	x:200
	y:303
	rotation:45

