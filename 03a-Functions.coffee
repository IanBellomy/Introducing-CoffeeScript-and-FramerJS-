###
	

	The programs in this document introduce: 
		
		• Functions

###


######################################## P
# We can write our own functions.
# In CoffeeScropt, a function or "function literal" looks like this:

-> #FUNCTION CODE HERE

# This is also called a "function declaration"
# The "->" means "The code that follows is code for a function"
# This above function has no code.

######################################## P
# Here the code 'print("I ran!")' is inside the function.
# Function code is not run immeidately. It is set aside to run LATER

-> print("I ran!")



######################################## P
# If we want to USE our function, we must store it in a variable.
# We can us the variable name to call the function.

applaud = -> print("clapping") # Store this function in the variable 'applaud'
applaud() # Call the custom function
applaud() # Call the custom function again
applaud() # ...and again


######################################## P
# You MUST declare a function BEFORE you use it.

applaud()						# ERROR: applaud does not exist! Computer barfs and program QUITS.
applaud = -> print("clapping")	# Code not executed because program quit
applaud()						# Code not executed because program quit

######################################## P
# When you declare a function, you are telling the computer to set those instructions aside for LATER.
# A function declaration DESCRIBES the function, it does not run the function code.

print("One")
applaud = -> print("clapping")	# Tell the computer to remember this code under the name 'applaud'
print("Two")				
applaud()						# Execute the applaud code
								# You can think of a function call as meaning "go to and run that code"
print("Three")


######################################## P
# A function can have multiple lines of code, separated by semi-colons.

applaud = -> print( "clapping"); print("clapping"); print("clapping");
applaud()


######################################## P
# You can write each line by itself using a tab-indent.
# This is the more common way of writing functions in CoffeeScript.

applaud = -> 
	print("clapping")	# The function's code is called the function's "body"
	print("clapping")
	print("clapping")

applaud()


######################################## P
# You can write functions that accept "arguments" or "input".


echo = (sound)-> # 'sound' becomes a variable for use inside of the function. The value is set when the function is called.
	print(sound)  # A variable used to hold incoming data is called a "parameter"
	print(sound)  # 'sound' is a parameter. Think of it like a function's "input".

echo "Hello!" # When we can call our function with the argument "Hello", we can use the shortcut like normal.
			  # The string "Hello!" will be assigned to the variable 'sound' when the function body runs.
			  # In other words, "Hello!" is put into the function.

echo "Goodbye!" # We can call our function with different arguments.

######################################## P
# Functions can be written to accept multiple arguments:

echo = (sound1,sound2)-> 
	print(sound1)	
	print(sound2)
	print(sound1)
	print(sound2)
	
echo "Hello","Sam" 


######################################## P
# NOTE: You can pass more arguments to a function than it can accept
# The extra arguments will be ignored

echo = (sound1,sound2)-> 
	print(sound1)	
	print(sound2)
	print(sound1)
	print(sound2)
	
echo "Hello","Sam","James","Bill" # Only the first two arguments are used here



######################################## P
# Functions can accept objects as arguments:

describe = (obj)-> 
	print(obj.x + "," + obj.y + "," obj.z)
	
volume = (obj)-> 
	return obj.width * obj.height * obj.depth
	
describe {x:0,y:10,z:100} 	# "0,10,100"

describe 	# "1,1,1"
	x:1
	y:1
	z:1

print(volume({width:1,height:10,depth:20}))	# 200



######################################## P
# Some functions, when called, turn into, or "return", data.
# For example, the built in function Number accepts primitive data, and returns a number.


print(Number("2"))  # Number("2") returns the number data '2'

# Function calls that return data can be used anywhere you use data, even as arguments.

######################################## P
# When using a function call as an argument, the calls are resolved from the inside out, like math.

print(Number("2"))  # 'Number("2")' is executed first.
print(Number "2")  	# This means the exact same thing as the line above.
print Number "2"  	# This means the exact same thing as the line above.


######################################## P
# In most languages, you can return data from a custom function by using the "return" keyword.

bake = (ingredient)->  
	results = ingredient + " pie"
	return results

print bake "apple"  # This is the same as 'print(bake("apple"))'


######################################## P
# In CoffeeScript (and JavaScript), a custom function will always return a value.
# In CoffeeScript, by default, a function returns whatever data is on the last line of its body.

bake = (ingredient)->  
	ingredient + " pie"
	
print bake "apple" 

# Tech Note: In JavaScript, if no value is explicitly returned using 'return', the function returns the special value 'undefined'.



######################################## P
# WARNING! In CoffeeScript, using multiple function calls on the same line with no parenthesis can lead to ambiguity...
# When using multiple function calls at once, it's a good idea to be very explicit.

print Number "2" + Number "2"   	# Translates to 'print(Number("2"+Number("2")))'  Oh noes!
print(Number("2") + Number("2"))	# More explicit.


######################################## 
######################################## End
######################################## 