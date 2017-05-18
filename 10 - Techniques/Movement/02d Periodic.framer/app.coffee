###
	
Periodic

In short, movement based on sin and cos.

This is not easy to explain quickly or without drawings and pictures. Here's one: http://www.mathwarehouse.com/animated-gifs/images/sine-cosine-unit-circle-animation.gif

The output of sin and cos changes smoothly back and forth between -1 and 1. We can use this to create smooth movements that alternate forever.

If you want more details, we'll have to talk in person.
	
###

centerDot = new Layer
	size:5
	backgroundColor: "black"
	x:Align.center
	y:Align.center

dot1 = new Layer
	size:20
	borderRadius: 20
	backgroundColor: "red"
	y:Align.center

dot2 = new Layer
	size:20
	borderRadius: 20
	backgroundColor: "grey"
	y:Align.center
	
rect = new Layer
	width: 2	
	height:100
	originY: 0
	
	
rect.midX = Screen.midX
rect.y = Screen.midY
	
angle = 0
rateOfChange = 0.05

Framer.Loop.on "update", ->
	angle += rateOfChange	
	
	dot1.x = Screen.midX + Math.sin(angle)*100
	
	dot2.x = Screen.midX + Math.sin(angle)*100
	dot2.y = Screen.midY + Math.cos(angle)*100
	
	rect.rotation = Math.sin(angle)*90 + 180