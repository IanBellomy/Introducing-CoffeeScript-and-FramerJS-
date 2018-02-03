###

Imagine a lock that opens with the right combination.

Select all the toggle buttons in the window.

Sometimes we want something specific to happen where there's a specific arrangment. A common example is a set of options or a combination lock. 

Before looking at this example, you'll want to review:
	Classes
	Conditionals (optional)
	Boolean Logic (optional)	
	Techniques: Simple Toggle Buttons

###

# Because we will make three of the same buttons, it's a good idea to make a class. 
class ToggleButton extends Framer.Layer
	constructor:(config)->
		super(config)
		@backgroundColor = "orange"
		@states.default.animationOptions = {time:0.25}
		@states.selected =
			backgroundColor: "limeGreen"
			borderWidth:25
			animationOptions:{time:0.25}
		@onMouseDown ->
			@states.next() 

bg = new Layer
	size:Screen.size
	backgroundColor: "white"
	
	
b1 = new ToggleButton	
b2 = new ToggleButton
	x:201
b3 = new ToggleButton
	y:201
	
handleChange = ->
	# This if statement is long, 
	# and the text wraping makes it look confusing.
	# Detach the canvas to see the code clearly.
	if b1.states.current.name == "selected" and b2.states.current.name == "selected" and b3.states.current.name == "selected"
		bg.animate
			backgroundColor:"black"
	else 
		bg.animate {backgroundColor:"white"}
				
b1.onMouseDown(handleChange)
b2.onMouseDown(handleChange)
b3.onMouseDown(handleChange)