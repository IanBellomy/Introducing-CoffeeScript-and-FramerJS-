###

	Quiz-Animations answers
	
###

######################################## 7.01-ClickColor

box = new Layer
box.center()
box.onMouseDown ->
	@animate
		backgroundColor:"red"



######################################## 7.02-Basic Button

btn = new Layer
	x:100
	y:100

btn.center()

btn.onMouseOver ->
	@animate
		scale:1.1
		backgroundColor:"red"		
		options:
			time:0.25

btn.onMouseOut ->
	@animate
		scale:1.0
		backgroundColor:"skyblue"		
		options:
			time:0.25

btn.onMouseDown ->
	@animate		
		rotation:10
		options:
			time:0.25

btn.onMouseUp ->	
	@animate
		rotation:0
		options:
			time:0.25
			


######################################## 7.03-MoveToClick 

bg = new Layer
	width:Screen.width
	height:Screen.height
	backgroundColor: "skyblue"

layer = new Layer
	backgroundColor:"white"
	
bg.onMouseDown (event)->
	layer.animate
		midX:event.pageX
		midY:event.pageY		
			


######################################## 7.04-Reveal Other

layer1 = new Layer
layer2 = new Layer
	y:layer1.height + 1
	opacity:0
	height:0

	
layer1.onMouseDown ->
	layer2.animate		
		opacity:1
		height:100


######################################## 7.05-Slide Transition

bg1 = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: "skyblue"

bg2 = new Layer
	width: Screen.width
	height: Screen.height
	x:Screen.width
	backgroundColor: "pink"

bg1.onMouseDown ->
	bg1.animate
		backgroundColor: "black"
			
	bg2.animate
		x:0
			
bg2.onMouseDown ->
	bg1.animate
		backgroundColor: "skyblue"
			
	bg2.animate
		x:Screen.width


######################################## 7.06-Click plop

back = new Layer
	width:Screen.width
	height:Screen.height
	backgroundColor: "skyblue"


back.onMouseDown (event)->
	new Layer
		width:100
		height:100
		backgroundColor:"white"
		midX:event.pageX
		midY:event.pageY


######################################## 7.07-Click plop animated

back = new Layer
	width:Screen.width
	height:Screen.height
	backgroundColor: "skyblue"

back.onMouseDown (event)->
	newLayer = new Layer		
		backgroundColor:"white"
		midX:event.pageX
		midY:event.pageY
		rotation: 45
		opacity:0
		width:100
		height:100
		scale:0
		
	newLayer.animate		
		rotation: 0
		opacity:1
		scale:1


######################################## 7.08-Click plop interactive

back = new Layer
	width:Screen.width
	height:Screen.height
	backgroundColor: "skyblue"


back.onMouseDown (event)->
	newLayer = new Layer		
		backgroundColor:"white"
		midX:event.pageX
		midY:event.pageY
		width:100
		height:100
		
	newLayer.onMouseOut ->
		@animate
			scale:0.5			
			options:
				time:0.25
			
	newLayer.onMouseOver ->
		@animate
			scale:1			
			options:
				time:0.25	