###
	
	FramerJS introduction: Animation / Triggered animation

	— Ian Bellomy, 2016

###

######################## P
# Any UI development framework should include a way to animate things.
# Framer is no exeption. It provides an Animation class. 
# You create an Animation instance, with some details, and then tell it to start.
# The Framer library takes care of the rest behind the scenes. You can think of this approach as "fire and forget"
# (This is common in most animation systems.)
# The detailsObject should include a couple properties:
# The 'layers' property notes which layer should be animated.
# The 'properties' property should contain yet another object with the desired end values.

box = new Layer

myAnimation = new Animation
	layer:box
	properties:{y:300}		# NOTE: 300 is the TARGET value, NOT the amount to "change by". 
							# In other words, the value is an absolute value, it is not releative to the layer's current y value. 
myAnimation.start()


# Framer's approach is to provide Layers with an animate(detailsObject) method.
# When called, an animation will be triggered and the library will take care of the rest. 

######################## P
# There is a bit of a shortcut using Layer.animate(animationDetails) 

box = new Layer

box.animate 
	properties:{y:300}	# When calling animate() on a layer, we don't need to specify which layer should be animated. 
						# We also don't need to call start() on an animation. The animation will start automatically


######################## P
# Another common property of the detailsObject is time. This sets the length of the animation.
# There are other options in the official documentation. (http://framerjs.com/docs/)

box = new Layer

# When creating complex detailsObjects, it's handy to use CoffeeScript's Object shorthand syntax.
box.animate					
		time:0.5			# The animation will last for 1/2 a second.
		properties:   		
			scale:1.2 		
			rotation:45
			backgroundColor:"#ff0000"


######################## P
# Animations are commonly used inside of event handler functions.

box = new Layer

box.onMouseDown ->						# Remember, the explicit form here is  .onMouseDown(handlerFunction)
	@animate							# Remember, '@' means 'this.' and 'this' refers to the Layer that emitted the event. When the handler function runs, '@animate' will mean 'box.animate'
		properties:   					 
			rotation:180 + @rotation	# If you want to animate BY a certain amount, create the target value by adding the change to the current value. 
										# Remember, the math here will be done BEFORE a value is assigned to properties.rotation 
										# NOTE: This approach is handy, but may not always provide the visual result you wanted. Try clicking a few times really quickly...

######################## P
# Calling layer.animate() while the layer is already animating will cancel the previous animation.
# This can be useful.
# Try rolling over and out of the box quickly.

box = new Layer
	x : 100
	y : 100

box.onMouseOver ->
	@animate
		time:3
		properties:
			scale:2
			
box.onMouseOut ->
	@animate
		time:3
		properties:
			scale:1			


######################## P
# Layers that are animating will emit an AnimationEnd event when the animation is complete.
# In other frameworks, a function that is called after a process is complete is sometimes named a "callback". 

box = new Layer

box.on Events.AnimationEnd, ->		# You can add the an AnimationEnd event handler any time before the animation is complete. But it's safest to add it before you start the animation.
	print "TA-DA!"
	
box.animate
	properties:
		rotation:180

######################## P
# The ability to respond to an animation end is useful for chaining animations.
# However, it can be a good idea to use .once() instead of .on() in these situations

box = new Layer

box.once Events.AnimationEnd, ->	# If we used .on() instead of .once(), then this function would be called after the x animation ran, and after than, and after that, and after that...
	@animate
		properties:
			x:300

box.onMouseDown ->
	@animate
		properties:
			y:180


######################## P
# Any animation system must "interpolate" between the starting value and the end values of an animation. 
# Interpolation is when a set of values between two values are calculated using an equation.
# Different equations can be used for interpolation. 
# Different equations result in different sets of values that lead to different looks, or easing, to an animated change. 
# Because of this, sometimes theseequations are called "easing equations". 
# The values of these equations, when graphed, will look like different kinds of curves: 
# Because of this, "easing equations" are sometimes just called "curves".
# In animation software, like After effects, you adjust these curves by hand.
# Many UI frameworks provide a set of premade options.
# Framer's options include: "ease-in", "ease-out", "ease-in-out".
# There are more options in the documentation.


box1 = new Layer
box2 = new Layer
	y:200

box3 = new Layer
	y:400


box1.onMouseDown ->			# I put these animations in the mouse down handler so you have control over triggering them.
	box1.animate
			curve:"ease-in"
			properties:
				x:400

	box2.animate
			curve:"ease-out"
			properties:
				x:400

	box3.animate
			curve:"ease-in-out"
			properties:
				x:400

