###
	
"Animation" is just change over time. 

By default, the computer will refresh the screen 60 times a second. If some visual value changes just a little each time, we get the appearence of movement, just like with a flip book.

To pull this off, we set a function to run every time the program needs to refresh the screen, and in the function, we modify something just a little bit. 

###

rect1 = new Layer
	backgroundColor: "skyblue"
rect2 = new Layer
	backgroundColor: "palegreen"
	size:120
rect3 = new Layer
	backgroundColor: "pink"
	size:50
	
rect1.center()
rect2.center()
rect3.center()

Framer.Loop.on "update", ->
	# the code in here runs about 60 times a second
	rect1.rotation += 0.2
	rect2.rotation -= 0.2
	rect3.rotation += 0.4
	