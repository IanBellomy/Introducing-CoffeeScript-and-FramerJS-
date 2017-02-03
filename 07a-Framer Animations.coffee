###
	
	FramerJS introduction: 

		• Basic Triggered Animation

###

######################## P1
# Any UI development framework should include a way to animate things.
# Framer is no exeption. The Framer layer has an animation method. 
# You call the method and pass it a object with details about the animation.
# The Framer library takes care of the rest behind the scenes. You can think of this approach as "fire and forget".
# (This is common in most animation systems.)
# Framer will change the layer properties over time to match the details object.
# In this way, the details object is a kind of animation "target".


box = new Layer

box.animate
	y:300		
	x:300		


######################## P2
# The details object can include an options property that contains more animation details.
# Two common options are time and delay. Time is the duration of the animation and delay is, well, a delay.

box = new Layer

box.animate						
	scale:1.2 		
	rotation:45				# Rotation is in degrees
	backgroundColor:"#ff0000"
	options:
		time:0.5			# The animation will last for 1/2 a second.
		delay:2 			# The animation will start in 2 seconds.  		

# There are other options in the official documentation. (http://framerjs.com/docs/)


######################## P3
# Animations are commonly used inside of event handler functions.

box = new Layer

box.onMouseDown ->						
	@animate							# Remember, '@' means 'this.' and 'this' refers to the Layer that emitted the event. When the handler function runs, '@animate' will mean 'box.animate'
		rotation:180 + @rotation		


######################## P4
# Calling layer.animate() while the layer is already animating can cancel the previous animation.
# This can be useful.
# Try rolling over and out of the box quickly.

box = new Layer
	x : 100
	y : 100

box.onMouseOver ->
	@animate	
		scale:2
		options:
			time:3		
			
box.onMouseOut ->
	@animate
		scale:1
		options:
			time:3


######################## P5
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
		x:400
		options:
			curve:"ease-in"			

	box2.animate
		x:400
		options:
			curve:"ease-out"
			
	box3.animate
		x:400
		options:
			curve:"ease-in-out"



######################## 
######################## Animation Events
######################## 
#
#	Before starting this section, review Advanced Event Handling
#

######################## P6
# Layers that are animating will emit an AnimationEnd event when the animation is complete.
# In other frameworks, a function that is called after a process is complete is sometimes named a "callback". 

box = new Layer

box.on Events.AnimationEnd, ->		# You can add the an AnimationEnd event handler any time before the animation is complete. But it's safest to add it before you start the animation.
	print "TA-DA!"
	
box.animate
	rotation:180

######################## P7
# The ability to respond to an animation end is useful for chaining animations.
# However, it can be a good idea to use .once() instead of .on() in these situations

box = new Layer

box.once Events.AnimationEnd, ->	# If we used .on() instead of .once(), then this function would be called after the x animation ran, and after than, and after that, and after that...
	@animate
		x:300

box.onMouseDown ->
	@animate
		y:180

