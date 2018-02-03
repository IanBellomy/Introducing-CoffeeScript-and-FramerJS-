# Mouse over the two buttons a few times.
# Note that the red one is glitchy.
# Because the red button scales down, the mouse is exiting the button.

document.body.style.cursor = "auto"

problemButton = new Layer
	backgroundColor: "red"
	width: 50
	height:50
	x:100
	y:50

problemButton.onMouseOver ->
	@animate
		scale:0.25


problemButton.onMouseOut ->
	@animate
		scale:1


# Better button!
# Instead of modifying the button.
# We treat the button as a container and put a layer in it for making the visuals.
# The button container is responsisble for reponding to events.
# It makes a visual hange happen by modifying its contents.
# It is the boss of its children so to say.
# Bascially the button acts as its own invisible hit-area or hotspot.

# Here we treat the button layer as a kind of container.
betterButton = new Layer
	backgroundColor: "clear" # The container should be transparent.
	width: 50
	height:50
	x:100
	y:100

# This visual layer is what we'll modify to achieve the visual result.
asset = new Layer
	backgroundColor: "black" 
	width: 50
	height: 50
	parent: betterButton # Place the asset in the button

# We create a custom property on the button that refers to the asset
# this will make it easier to refer to.
betterButton.asset = asset

# The button is in charge. It is responsible for handling events...
betterButton.onMouseOver ->
	@asset.animate	# but it handles them by animating its asset 
		scale:0.25

betterButton.onMouseOut ->
	@asset.animate
		scale:1
				

# This approach can be used to make complex buttons.
# and buttons that visuall cover other items without making them un-touchable.
complexButton = new Layer
	x:100
	y:150
	size:50
	backgroundColor: "clear"

complexAsset1 = new Layer
	size:50
	backgroundColor: "grey"
	parent: complexButton	

complexAsset2 = new Layer
	size:50
	backgroundColor: "white"
	parent: complexButton
	scale: 0
	
complexButton.asset1 = complexAsset1
complexButton.asset2 = complexAsset2

complexButton.onMouseOver ->
	@asset1.animate
		scale:4
	@asset2.animate
		scale:1

complexButton.onMouseOut ->
	@asset1.animate
		scale:1
	@asset2.animate
		scale:0
	