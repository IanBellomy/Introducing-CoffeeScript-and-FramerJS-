######################################## P11
# (THIS PROGRAM IS AN EXAMPLE AND WILL NOT RUN)
# Why pass objects?
# Imagine a complex function that accepts lots of input:

makeExplosion = (width,height,depth,rotationX,rotationY,rotationZ,scalex,scaley,scalez,color,stoke,blend,img,alpha) ->
	# . . . complex code here . . .

# When we call makeExplosion we have to remember the entire list of parameters in the right order. This is hard for humans.
# The function call will also be hard to make sense of after we write it:
makeExplosion(10,100,1,0,0,0,1,1,2,"red","blue","screen","fire.jpg",0.5)

# And if we want to make a default result with just one thing different, we still have to remember and write out everything.
makeExplosion(1,1,1,0,0,0,0,1,1,"red","blue","screen","fire.jpg",0.25)

# Because of these reasons, complex functions in CoffeeScript and Javascript are often made to accept objects
makeExplosion = (detailsObject) ->
	# ... complex code ...

# This way we can write clear and concise function calls
makeExplosion({opactiy:0.25}) # assumedly this would be an explosion with default values, excpet for opacity





######################################## P0
# Here's the same thing using some shorthand. You'll see things like this a lot in Framer projects. 

box = new Layer
box.onMouseDown -> 		
	print("CLICK!")






########################################
######################################## Return Values [ optional ]
########################################

######################################## P12
# Some functions, when called, turn into, or 'return', data.
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
print(pie)


######################################## P15
# In CoffeeScript, by default, a function returns whatever data is on the last line of its body.
# This can save us some typing:

bake = (ingredient)->  
	ingredient + " pie" # The math is executed and the results are automatically returned
	
print(bake("apple")) # I'm using the result of the bake function as the input the print function


######################################## 
######################################## End
######################################## 