###
	
	The programs in this document introduce: 
		
		• (Custom) Functions
	
	
	Interface programming is mostly about telling the computer to run some code when something happens.
	We chunk together code and refer to it by writing custom functions. 	

###

######################################## P0
# Before we get into details here's a tiny example of a basic interaction using a custom function.
# Don't fret about the bits we haven't talked about yet.

box = new Layer
box.onMouseDown( -> print("CLICK!") )	# When we press on the box, print "CLICK!"


######################################## P1
# In CoffeeScropt, a custom function or 'function literal' follows this pattern:
#
# -> CODE
#

# Example:
-> print("Hello?")	

# The '->' means 'new function here'
# The code that comes after -> is the 'function body'
# All together this is called a 'function literal'. It is literally a function. 
# The code of the function literal above will not run immediately. It's only stored for later. However, we have no way to refer to it.
# To use a custom function we need to store it in a variable; naming it in a sense. 

shout = -> print("AH!")	# Create and store a function in the variable shout.

shout() # Call our function by name,  "AH!"
shout() # We can call it many times,  "AH!"
shout() # ...						  "AH!"

# When we call the function shout, the computer jumps to the function code on line 36, 
#   runs the code, then goes back to where it left off. 
# In this way, our programs don't HAVE to run from top to bottom.
# We can use functions to make the computer jump around to different parts and even reuse chunks of code.
# Normally, our functions will have more code than just print.
# The shout function here is just a very simple example.


######################################## P2
# You must declare a function before you use it.

shout()					# ERROR: shout does not exist! Computer barfs and program stops executing.
shout = -> print("AH!")	# Code not executed because program stopped.
shout()					# Code not executed because program stopped.

######################################## P3
# A function body can have multiple statements separated by semi-colons.

applaud = -> print("clap"); print("clap"); print("clap");
applaud()	# "clap"
			# "clap"
			# "clap"


######################################## P4
# A big function on one line is hard to read. 
# CoffeeScript allows you to write a multi-statement function by using indentation.
# This is much easier to read and we will use this approach moving forward.

applaud = -> 		# The new function starts at -> and continues through the next three lines...
	print("clap")	# Code INSIDE the function. Saved for later.
	print("clap")	# Code INSIDE the function. Saved for later.
	print("clap")	# Code INSIDE the function. Saved for later.

print("Hello")	# OUTSIDE the applaud function. This code runs immediately. 	"Hello"
applaud()		# applaud called, "clap"
				#				  "clap"
				#				  "clap"


######################################## P5
# You can write functions that accept 'input' or 'arguments' just like print() accepts arguments.

echo = (input)->  # 'input' is a variable that only exists inside of our echo function. Its value is set when the function is called later.
				  # Note that the parenthesis are used in a different way here. On line 85 they do not indicate a function call.
	print(input)  # On this line we use the parenthesis like normal to call the function print.
	print(input)  # echo's input variable can only be used in its function body. It disappears once the function is complete. 
				  
				  

echo("Hello!") 	 # The string "Hello!" will be assigned to echo's input variable when the echo function runs.	"Hello!"	
				 #																								"Hello!"			
echo("Goodbye!") # When the echo function runs this time, input will be set equal to "Goodbye!"					"Goodbye!"
				 #																								"Goodbye!"
print(input)	 # ERROR. Input doesn't exist outside of the echo function.  
				 # You can think of a function as an itty bitty program with its own variables.
				 # The variables only exist in that function, just like your variables only exist in your program.
				 # Once the function is done running the function variables disappear, just like with a program.
				 # These kinds of variables are technically called 'parameters'.
				 # The -data- that is passed to the parameter is called an 'argument'. 
				 # We can say 'The echo function has one parameter named input' or 'The echo function accepts one argument'
				 
# NOTE: A function's parameters can be named anything following normal variable naming rules. 


######################################## P6
# Functions can have multiple parameters, i.e. they can accept multiple arguments:

echo = (sound1,sound2)-> # 'sound1' and 'sound2' are both function variables, e.g. parameters.
	print(sound1)		 # They only exist in the echo function.
	print(sound2)
	print(sound1)
	print(sound2)
	
echo("Hello","Sam")		# "Hello"
						# "Sam"
						# "Hello"
						# "Sam"

######################################## P7
# Using a function name without parenthesis NORMALLY has no effect. 
# For exceptions, see 01a-variables.pdf, P14

shout = -> print("AH!")	
shout					# Nothing! We only referred to the function. We didn't call it. 
shout()					# "AH!"


######################################## P8
# There are reasons to refer to a function without calling it.
# This allows us to pass a function to another function. 

shout = -> print("AH!")		# Create a function
print(shout)				# <Function () { return print("AH!"); }>							
							# Notice that we're treating the function as data, and passing it to the shout function.
							# Think of line 135 as handing a friend some written instructions that they read out loud but do not perform.			
				
######################################## P9
# Treating custom functions as data allows us to make logical connections between inputs and consequences. 
# Framer layers have special built in functions that allow us to 'bind' an input event to a custom function.

box = new Layer()
shout = -> print("AH!")				
sigh = -> print("Whew!")				
box.onMouseDown(shout)		# When we mouse press on box, the function shout is called. 
box.onMouseUp(sigh)			# When we mouse release on box, the function sigh is called. 

# We'll talk about this more in future sections.


######################################## P10
# Instead of naming the function and then referring to it, we can also use a function literal to create behaviors.
# The code below creates the same interactive behavior as the previous code. (Though the program isn't -exactly- wired together the same.)

box = new Layer()
box.onMouseDown(-> print("AH!"))		# When we mouse press on box, the function shout runs. 
box.onMouseUp(-> print("Whew!"))		# When we mouse release on box, the function sigh runs. 
										# These unnamed literal functions are sometimes called an anonymous functions. 


######################################## P11
# We can pass objects to functions. i.e. Functions can accept objects as arguments. 
# This is a common practice when using Framer and other UI frameworks. 
# We will talk about it more in the animation section.

printArea = (input)-> 					# When called on lines 170,171,and 172, the variable input becomes equal to whatever object was passed in.
	print(input.width * input.height) 	# Here .width and .height refer to the width and height of whatever object was passed in.
	
box1 = {width:20,height:10}
box2 = {width:10,height:10}
box3 = {width:2,height:10}

printArea(box1) # 200
printArea(box2) # 100
printArea(box3) # 20


######################################## P12 [ Optional ]
# We can use CoffeeScript's function shorthand when calling our own functions.

echo = (input)-> 	# Note that the parenthesis around the function's parameter is still required.
	print input 
	print input  

echo "Hello!" 		# Exactly the same as echo("Hello!"),	"Hello!"
					#										"Hello!"
echo "Goodbye!"		# Exactly the same as echo("Goodbye!")  "Goodbye!"
					#										"Goodbye!"

######################################## P13 [ Optional ]
# Shortcuts for objects and function calls can be combined.
# This allows for very quick writing but means that some very different expressions can look very similar...

print 				# Call the function print and pass it a literal object, 	{width:1,height:1}
	width:1	
	height:1					

box = 				# Assign object data to the box variable
	width:1
	height:1

box  				# ERROR: Attempted to call a box function but box is not a function.
	width:1
	height:1
	
# This approach will come in handy later when coding animations.

########################################
######################################## END
########################################
