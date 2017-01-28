###
		
	The programs in this document introduce: 
		
		• Methods

###

######################################## P1
# A function can be assigned to an object property.
# When a function belongs to an object like this, it is called a "method"

cat = {}
cat.eat = (food)->  
	print "I pooped "+ food	

cat.eat("kibbles")  # methods are "called" just like functions, because they are functions
cat.eat "kibbles"	# you can use the Coffeescript's shortcut just like with functions



######################################## P2
# We can define a method in an Object Literal.
# This gets messy though...

cat = {eat: ((food)->  print "I pooped "+ food)} 

cat.eat "kibbles" 



######################################## P3
# You can also define a method using CoffeeScript's Object Literal Shorthand.

cat = 				# variable declaration 
	name:"mittens"	# property, and the beginning of the object literal
	age:10			# property
	eat:(food)->  	# method declaration
		print("I pooped ")+ food	# method body

print cat.name
print cat.age
cat.eat "kibbles" 


######################################## P4
# In any language, in a method, you can refer to the Object that the method belongs to.
# In JavaScript and CoffeeScript, we use the keyword 'this'.

name = "cat program" # variable decleration and assignment

cat1 =	
	name:"meowz"
	speak:->
		print this.name	# when this code runs, 'this' becomes 'cat1'

cat2 =	
	name:"mittens"
	speak:->
		print this.name	# when this code runs, 'this' becomes 'cat2'


cat1.speak()	# because these method calls include no arguments, we must use '()'
cat2.speak()

######################################## P5
# Methods can also modify the variables of the object they belong to.

cat = 
	hairballs:10
	hork:->  
		this.hairballs = this.hairballs - 1
		print this.hairballs + " remaining"



cat.hork()	# notice how the method call has the same GENERAL effect
cat.hork()	# but the SPECIFIC results are different
cat.hork()



######################################## P6
# In CoffeeScript, "this." can be replaced with "@".
# Note that the dot after "this" is also replaced.
# The shortcut is very common in CoffeeScript code.

cat = 
	hairballs:10
	hork: ->  
		@hairballs = @hairballs - 1 	# same as 'this.hairballs'
		print(this.hairballs + " remaining") # Using parenthesis here for clarity


cat.hork()
cat.hork()
cat.hork()



######################################## P7
# JavaScript (and CoffeeScript) have many built in functions.
# They are often organized by being attached to an Object.
# For example, many mathematical functions are attached to the built in 'Math' Object.

print Math.round(3.14) 	# round a number to the closest whole number
print Math.cos(0)  		# Cosine of an angle
print Math.random() 	# Returns a number between 0 and 1

# You can find a full list of mathamatical functions by googling "javacript math object"


######################################## 
######################################## End
######################################## 