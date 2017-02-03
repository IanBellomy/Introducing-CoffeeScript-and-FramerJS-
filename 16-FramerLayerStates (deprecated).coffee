###
	
	FramerJS introduction: States

###

######################## P
# It might be easiest to understand states by looking at several examples:

box = new Layer

box.states.add({tiltedState:{rotation:45}})	# Add a new state called "tiltedState". The state is an object with a rotation property. 
box.states.switch("tiltedState")	# Switch to the tiltedState. Framer will animate the layer so that it matches the properties of that state.
									

######################## P
# Another example

box = new Layer

box.states.add({wideState:{width:400}})	# Add a new state called "wideState". This time the state involves a specific width, not a rotation. 
box.states.switch("wideState")			# Switch to the wideState. 

######################## P
# This example is the same above, but with object shorthand notation. Using shorthand when working with states is more common.

box = new Layer

box.states.add
	wideState:
		width:400

box.states.switch("wideState")


######################## P
# Here, we had two states at once. 

box = new Layer

box.states.add
	wideState:
		width:400	
	tiltedState:
		width:45	

box.states.switch("wideState")

######################## P
# Here, we had two states at once. 

box = new Layer

# Adding a selected state wherein the backgroundColor will be black.
box.states.add
	selected:
		backgroundColor:"black"

box.onMouseDown ->
	@states.switch("selected")		# Here, we switch states when the layer is clicked. 


######################## P
# Here is the generic structure for states.add() and states.switch()
# This is pseudo-code and will not run.

LAYER.states.add
	STATE_NAME:				# STATE_NAME is a name for a specific state. 
		PROPERTY:VALUE		# Each specific state is an object with as many property:value pairs as you'd like
		PROPERTY:VALUE		
		...
	ANOTHER_STATE_NAME:		# You may add as many specific states at once as you like. 
		PROPERTY:VALUE
		PROPERTY:VALUE		
		...

box.states.switch("STATE_NAME")  # NOTE: When we call switch, we use a String.

######################## P
# State switching is useful for making rollovers quickly

button = new Layer
	backgroundColor:"gray"

button.center()	# I'm centering the box so we can see the rollover animation better.

button.states.add
	hovered:
		backgroundColor:"red"
		scale:1.2

button.onMouseOver ->
	@states.switch("hovered")

button.onMouseOut ->
	@states.switch("default")		# There is always a default state. The values of the default state are whatever values the Layer was created with.
									# NOTE: The default state DOES NOT include values that were changed AFTER the layer was created. 
									#
									# example:
									#
									# b = new Layer
									#	rotation:45 			# rotation and backgroundColor WILL be included in the default state.
									#	backgroundColor:"red"
									#
									# b.html = "Hello"	# <- Because the html property is set AFTER layer creation, it will NOT be included in the default state.
									#



######################## P
# We can modify how the state change animation runs by setting the State object's animationOptions property.

button = new Layer
	backgroundColor:"gray"

button.center()

button.states.add
	hovered:
		backgroundColor:"red"
		scale:1.2

button.states.animationOptions = {time:0.25}	# This should feel much snappier now. We could also include a curve property if we wanted. 

button.onMouseOver ->
	@states.switch("hovered")

button.onMouseOut ->
	@states.switch("default")		# There is always a default state. The values of the default state are whatever values the Layer was created with


######################## P
# The State object has a very useful .next() method.
# Calling it changes to the next state. If we're already on the last state, Framer will go back to the default state.
# We can use this behavior to quickly create a toggle button.

toggle = new Layer
	backgroundColor:"gray"

toggle.center()

toggle.states.add
	selected:
		backgroundColor:"red"
		scale:1.2

toggle.states.animationOptions = {time:0.25}

toggle.onMouseDown ->
	@states.next()




######################## P
# The State object has a very useful property, .current
# It contains a String with the name of the current state.

toggle = new Layer
	backgroundColor:"gray"

toggle.center()

toggle.states.add
	selected:
		backgroundColor:"red"
		scale:1.2

toggle.states.animationOptions = {time:0.25}

toggle.onMouseDown ->
	@states.next()
	print @states.current		# NOTE: the '.current' property is "read only". You can not assign new values to it. You can only look at, or "read", the values it contains. 


######################## P
# We can find out what state the object is in by checking the State object's .current property
# This property contains a String with the name of the current state.

bug = new Layer
	backgroundColor:"gray"

bug.center()

bug.states.add
	angry:
		backgroundColor:"red"
		scale:1.5
		rotationX:180	# rotationX and rotationY are used here for fun. Framer layers are 3D by default, and can be rotated around the x, y, or z axis.
		rotationY:180		

	dead:
		backgroundColor:"#eeeeee"
		scale:0.5
		rotation:155
		rotationX:0
		rotationY:0		

bug.states.animationOptions = {time:0.75}

bug.onMouseDown ->
	@states.next()							
	if @states.current == "dead"			# Here, we have the computer make a decision. This will be discussed in the next section on conditionals.
		bug.style.pointerEvents = "none"	# The CSS property 'pointerEvents' controls whether or not elements produce mouse events. 
											# The default value is "auto". Setting it to "none" will prevent the layer from emitting mouse events.
											

