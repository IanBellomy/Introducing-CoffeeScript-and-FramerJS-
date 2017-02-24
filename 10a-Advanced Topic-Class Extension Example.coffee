###

	Class extension example

###

# The keyword "extends" means that our class Box will have all 
# the methods and properties of the Layer class it extends

class Box extends Layer	

	# It's not a good idea to overwrite properties in the parent class
	# so we'll do all our setup in the constructor function

	# To make sure we can create instances in the same way we
	# create normal layers, out constructor funciton needs a parameter

	constructor:(settings)-> 
		super(settings)	# "super" refer's to the parent class's constructor.
						# Here we call the defaul layer constructor and pass
						# it the settings object.

		@width=100		# Now we can do whatever we want 
		@height=100
		@opacity = 0.5
		@backgroundColor="skyblue"

		@onMouseDown ->		# we can add event handlers. 
			@animate
				rotation:45
				

# Here we make several instances of our box class
# each one has the same behaviors we programmed above. 

b = new Box

b2 = new Box
	y:101
	
b3 = new Box
	x:101
	
b4 = new Box
	x:101
	y:101
	