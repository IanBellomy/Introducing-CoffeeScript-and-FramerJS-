###

Framer Layers have a useful 'states' property that allows us to quickly create simple state-switching behavior. 

We can use this for toggle buttons and the like.

###

############################### Basic toggle between two states

b1 = new Layer
	backgroundColor: "orange"	
	
# The initial configuration is a state, the 'default' state. 
# We can configure the animation options for this state like so:
b1.states.default.animationOptions = {time:0.25}

# Add another state
b1.states.selected =
	backgroundColor: "limeGreen"
	borderWidth:25
	animationOptions:{time:0.25}

b1.onMouseDown ->
	b1.states.next() 


############################### Two states and with child layers
b2 = new Layer
	backgroundColor: "orange"
	y:201

b2.states.selected =
	backgroundColor: "limeGreen"	
	animationOptions:{time:0.25}

b2.states.default.animationOptions = {time:0.25}

b2.asset = new Layer
	parent: b2
	backgroundColor: "white"
	height: 160
	width: 80
	y:Align.center
	x:20
	opacity: .5

b2.asset.states.default.animationOptions = {time:0.25}
b2.asset.states.selected = 
	x:200-80-20
	opacity:1
	animationOptions:{time:0.25}

b2.onMouseDown ->
	@states.next()
	@asset.states.next()
	
############################### More than two states
b3 = new Layer
	backgroundColor: "red"
	x:201

b3.states.maybe =
	backgroundColor: "orange"		
	animationOptions:{time:0.25}

b3.states.yes =
	backgroundColor: "limeGreen"		
	animationOptions:{time:0.25}

b3.states.default.animationOptions = {time:0.25}
	
b3.onMouseDown ->
	@states.next()
	
	