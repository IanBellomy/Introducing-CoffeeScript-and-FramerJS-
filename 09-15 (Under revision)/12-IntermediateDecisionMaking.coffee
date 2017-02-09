###

	Intermediate decision making:
		Remembering things.
	 	Responding to the "no data" scenario.

	(These can be explored using protyp.in)

###


######################## P
# From the computer's point of view, the current situation is what it can measure AND what it remembers.
# For a program to "know" what has happened, later, it needs to remember what things are like right now.
# Any time we need a program to remember something, we need to use the computer's memory. 
# We do this using a variable.

bg = new Layer
	width:Screen.width
	height:Screen.height

clicks = 0	# Any time we need the computer to remember something, we need a variable. 

bg.onMouseDown ->
	clicks = clicks + 1	# For the program to make a decision, we must remember something now.
	if clicks == 3
		print "Third time is a charm."	


######################## P
# It can be useful to set aside memory before we have data.

topScore = undefined 	
print topScore

# JS and CS have a special basic datatype called undefined.
# It is represented by the keyword undefined
# It means: "There could be basic data here, but there is not."
# It can be used as a placeholder.
# This allows us to create variables before we have data for them


######################## P
# Here's a simple example

bg = new Layer
	width:Screen.width
	height:Screen.height

previousX = undefined

bg.onMouseDown (event)->
	print "Previous click was " + previousX 
	print "This click was " + event.pageX
	previousX = event.pageX		# remember where the last click was.


######################## P
# Undefined is handy, but is dangerous to use in expressions.

print 1 + undefined  

# NaN stands for "Not a Number"
# NaN is another special basic data type.


######################## P
# NaN is like toxic waste to math. It turns everything it touches into NaN

a = 1 + undefined
b = 2
c = a + b

print c
print c + 1

######################## P
# NaN isn't even equivalent with itself!

print NaN == NaN	# false!


######################## P
# For these and other reasons, using undefined without care can lead to cascading problems in a JS/CS program
# For these and other reasons, we often need to check if a value is undefined before using it
# In JS/CS we can check to see if a variable contains the value undefined by using the equivalence operator

noData = undefined
hasData = 1

print(emptyVar == undefined)
print(hasData == undefined)

if noData == undefined
	print "The variable noData is undefined."



######################## P
# In JS/CS we can see variables are not equivalent using the "not equal" comparison operator, !=

print 1 != 2 					# Is 1 not equal to 2? Yes. The result is true
print 1 != 1 					# Is 1 not equal to 1? No. The result is false
print 1 != undefined 			# Is 1 not equal to undefined? Yes. The result is true
print undefined != undefined 	# Is undefined not equal to undefined? No. The result is false


######################## P
# Example use:

bg = new Layer
	width:Screen.width
	height:Screen.height

oldBox = new Layer
	width:20
	height:20
	backgroundColor: "grey"
	opacity: 0	

newBox = new Layer
	width:20
	height:20
	backgroundColor: "white"
	opacity: 0

previousClickX = undefined
previousClickY = undefined

bg.onMouseDown (event)->
	if previousClickX != undefined 		# Effectively, we're checking to see if this is the first time we've clicked. 
		oldBox.midX = previousClickX
		oldBox.midY = previousClickY
		oldBox.opacity = 1
		
	newBox.opacity = 1
	newBox.midX = event.pageX
	newBox.midY = event.pageY
	
	previousClickX = event.pageX
	previousClickY = event.pageY


