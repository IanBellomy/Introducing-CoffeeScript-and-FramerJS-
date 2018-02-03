###

	Radio Buttons

	Sometimes we need something to change when something else is clicked. The most common example is a set of options where only one choice is possible. This is called a radio button set. Each radio button is a kind of toggle button, but it's behavior is depends on the other buttons.
	The rule of thumb for these cases is that the parent is reponsible for the children. The buttons don't control themselves or each other; the parent controls the buttons. This rule applies to broadly to interface programming.

	Before looking at this example, you'll want to review:
		Classes
		Conditionals


###

# Because we'll have multiple buttons of the same kind, it's a good idea to conslidate their functionality in one place.
# BUT!
# Because their behavior depends on other buttons, the individual buttons will not be reponsible for responding for changing themselves on click.
class RadioButton extends Layer
	constructor:(config)->
		super(config)
		@backgroundColor = "orange"
		@states.default.animationOptions = {time:0.25}
		@states.selected =
			backgroundColor: "limeGreen"
			borderWidth:25
			animationOptions:{time:0.25}
		
		# The button is not responsible for 
		# chaning its states. 		
# 		@onMouseDown ->
# 			@states.next()	

# In general, an interface widget / component / element / thing should be self contained. It's code should not reach out and touch other elements and it should not need to know about other things goingon. We want our elements to be like solid building blocks, not wormy parasites.

# Because the behavior of each button depends on the other buttons, their 'parent' should be responsible for their changes. In a sense, each button is a -piece- of a more complex element, a radio button set. The parent (or the set) tells the children what to do. Right now, their parent is the main document, so the main document will be reponsible. It will act as the radio button set. The main document will keep track of who is selected and what happens when a button is clicked. 

# First, we need to remember what's selected
# Right now, nothing is selected. 
currentSelection = null

# We'll use this one function to respond to a click on any of our radio buttons.
radioButtonHandler = (event,newSelection) ->			
	# There are three situations we can be in 
	# when a button is clicked.
	
	# Nothing is selected
	if currentSelection == null
		# turn on the clicked button
		newSelection.animate("selected")
		# remember what was clicked
		currentSelection = newSelection
	# Something is selected and we've clicked it.
	else if currentSelection == newSelection
		# Un-selected the button.
		newSelection.animate("default")
		# remember that nothing is selected now
		currentSelection = null
	# Something is selected and we click a DIFFERENT item	
	else if currentSelection != newSelection				
		# unslect the last item
		currentSelection.animate("default")
		# select the clicked item
		newSelection.animate("selected")		
		# remember what is selected
		currentSelection = newSelection

	# NOTE the use of 'else if'!
	# Only one of these three situations can happen at a time.

# Create our buttons. Nice and simple
b1 = new RadioButton	
b2 = new RadioButton
	x:201
b3 = new RadioButton
	y:201
	
# Add the event handler to each button
b1.onMouseDown radioButtonHandler
b2.onMouseDown radioButtonHandler
b3.onMouseDown radioButtonHandler