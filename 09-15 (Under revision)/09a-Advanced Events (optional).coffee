###
	
	Introduction: 

		• Advanced Event Handling

	on( "name", HANDLER )
	on( Event.Name, HANDLER )
	onEventName( HANDLER )

	off "name", HANDLER	

	once "name", HANDLER

	
	Technique: Using one handler for multiple objects
	Technique: Factory?	
	Technique: Custom Events
	Technique: Event Propigation
	TIP: Don't Add a Handler Multiple Times!
	
	onAnimationComplete


###




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

