###
	
	The programs in this document introduce: 
		
		• Functions
	

	Interface programming is mostly about telling the computer to run a custom function when some event happens.
	So we need to know how to create our own functions. 

###

######################################## P1
# In CoffeeScropt, a function or "function literal" looks like this:
#
# -> FUNCTION CODE/BODY
#
# example:

-> print("I ran!")	

# This code will have no result right now.
# The "->" means "new function starting here"
# The code that comes after is the "function body"
# All together this is called a "function declaration" 


######################################## P3
# The function does not run automatically though. 
# It is set aside for running LATER.
# It is as if you -explained- to the computer how to do something instead of -telling- it to do something.

print("step 1")
-> print("I don't run") 
print("step 2")


######################################## P3
# If we want to USE our function, we must store it in a variable so we can refer to it.
# We can us the variable name to call the function.

applaud = -> print("clapping") # Store the function in the variable 'applaud'
applaud() # Call the custom function
applaud() # Call the custom function again
applaud() # ...and again

# In a sense, we have named our function.

######################################## P4
# NOTE: You MUST declare a function BEFORE you use it.

applaud()						# ERROR: applaud does not exist! Computer barfs and program may quit.
applaud = -> print("clapping")	# Code not executed because program quit
applaud()						# Code not executed because program quit


######################################## P5
# Again, a function declaration DESCRIBES the function, it does not run the function code.
# Pay careful attention to the order that the print commands run.

print(1)
sayThree = -> print(3)			# Tell the computer to remember this code under the name 'applaud'
print(2)				
sayThree()						# Execute the applaud code.
								# You can think of a function call as meaning "go to and run that code"
print(4)


######################################## P6
# A function can have multiple lines of code, separated by semi-colons.

applaud = -> print("clapping"); print("clapping"); print("clapping");
applaud()


######################################## P7
# You can write each line by itself using a tab-indent.
# This is the more common way of writing functions in CoffeeScript.

applaud = -> 
	print("clapping")	# Code INSIDE the function body
	print("clapping")	# Code INSIDE the function body
	print("clapping")	# Code INSIDE the function body
print("Hello")	# Code OUTSIDE the function body				
applaud()	# Code OUTSIDE the function body				


######################################## P8
# You can write functions that accept "arguments" or "input"


echo = (sound)->  # 'sound' is a variable that only exists inside of the function. The value is set when the function is called.
	print(sound)  # The sound variable dissapears once the function is complete. 
	print(sound)  # You can think of a function as an itty bitty program. When it runs it may create some variables.
				  # And once the function is done running it cleans up its variables, just like a full program does.
				  # To be technical, a variable that is part of a function declaration is called a "parameter".
				  # The -data- that is passed to the parameter during the function call is called the "argument". 
				 

echo("Hello!") 	# The string "Hello!" will be assigned to the parameter 'sound' when the echo function runs.
				# But sound will only equal "Hello" this one time.	  	

echo("Goodbye!") # When the echo funtion runs this time, 'sound' will be set equal to "Goodbye!"

######################################## P8b
# When we can call our function with an argument, we can use CoffeeScript's shortcut like normal.

echo = (sound)-> 
	print(sound)  
	print(sound)  

echo "Hello!" 		# Exactly the same as echo("Hello!")
echo "Goodbye!"		# Exactly the same as echo("Goodbye!")

######################################## P9
# Functions can be written to accept multiple arguments:

echo = (sound1,sound2)-> # 'sound1' and 'sound2' are both parameters.
	print(sound1)	
	print(sound2)
	print(sound1)
	print(sound2)
	
echo("Hello","Sam")


######################################## P10
# NOTE: You can pass more arguments to a function than it can accept
# The extra arguments will be ignored

echo = (sound1,sound2)-> 
	print(sound1)	
	print(sound2)
	print(sound1)
	print(sound2)
	
echo("Hello","Sam","James","Bill") # Only the first two arguments are used by the function. The second two are ignored



######################################## P11
# Functions can accept objects as arguments.
# This is a super common activity when using Framer. We will talk about it more in the animation section

printArea = (obj)-> 
	print( obj.width * obj.height )
	
	
printArea({width:20,height:10}) 	# "0,10,100"



######################################## P11b
# CoffeeScript shortcuts for objects and functions can be combined.
# This leads to very easy to write code, but the code may be ambiguous unless you
# understand the shortcuts. 

printArea = (obj)-> 
	print( obj.width * obj.height )
	
	
printArea({width:20,height:10}) 	# "0,10,100"

printArea {width:20,height:10} 	# Exactly the same as above

printArea 						# Exactly the same as above
	width:1
	height:1


# I'll avoid the shortcuts for a little longer. 


########################################
######################################## Extra
########################################

######################################## P12
# Some functions, when called, turn into, or "return", data.
# For example, the built in function Number accepts primitive data, and returns a number.


print(Number("2"))  # Number("2") returns the number data '2'

# Function calls that return data can be used anywhere you use data, even as arguments.

######################################## P13
# When using a function call as an argument, the calls are resolved from the inside out, like math.

print(Number("2"+"2"))  # The math is executed first, the result "22" is passed to the Number function, 
						# and the result of that is passed to the print function.


######################################## P14
# In most languages, you can return data from a custom function by using the "return" keyword.

bake = (ingredient)->  
	return ingredient + " pie"	

pie = bake("apple") # Try making different kinds of pies!
bake(pie)


######################################## P15
# In CoffeeScript, by default, a function returns whatever data is on the last line of its body.
# This can save us some typing:

bake = (ingredient)->  
	ingredient + " pie" # The math is executed and the results are automatically returned
	
print(bake("apple")) # I'm using the result of the bake function as the input the print function


######################################## 
######################################## End
######################################## 