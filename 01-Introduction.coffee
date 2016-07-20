###
	
	What follows are tiny CoffeeScript programs. 
	Each program is separated by: ######################################## P	
	
	These programs introduce fundamental concepts about: 
		
		• Primitive datatypes.
		• Operations.
		• Assignment and Variables
		• Objects (and references)
		• Functions		

	To use this document:

		1. Go to http://prototyp.in	
		2. Type out, by hand, each program, by itself.

			(You can ignore any lines with instructions or commentary.)

		3. Make notes where anything is the least bit confusing. Experiment with specific example to explore how it works.

	These were originally created for use in the classroom where an instructor can answer questions as needed.

	— Ian Bellomy, 2016

###

######################################## P
# Some words are like magic spells. 
# We cast the spell by using a keyword, followed by parenthesis and a semi-colon.
# In programming we call spells "functions".
# Casting them is called "calling" them.
# Below, we "call" the "function" print. 

print()  # A panel should pop up on the right side. 


######################################## P
# If you try to use a function that doesn't exist, you'll get an error.

explode()


######################################## P
# Some functions accept additional details.
# We call these details "arguments".

print(100) 	
print(100,200,300)


######################################## P
# In CoffeeScript, if we "call" a function with "arguments", we can leave out the parenthesis.
# This is common shortcut in CoffeeScript.

print 100
print 100,200,300

# If you feel more comfortable with parenthesis, feel free to use them.



######################################## P
# Computers do math.
# +,-,/,* are called "operators" or "operations".
# A math expression is called an "expression".
# Expressions are always solved BEFORE function calls.
# For example, 'print 10+10' becomes 'print 20' and then the computer runs that code.

print 10+10 
print 10-10
print 10*10
print 10/10



######################################## P
# Data comes in different types, or "data types".
# Some data types are "primitive" and are built into the language.
# CoffeeScript/Javascript has a few primitive data types:

# A "String" of characters.
print "1,000.0"   

# A "Number" 
print 1000.0

# A "Boolean" 
print true

# Tech Note: CoffeeScript and JavaScript do not distinguish between integers and floating point numbers like some other languages.



######################################## P
# In JavaScript and CoffeeScript, data types affect how operations work.
# Technically, the computer will try to convert the data to something that works. 

print 2+2
print "2"+"2"
print "2"+2 	 	
print "2"*2 

# (Some languages play it safe and refuse to convert data unless told to.)


######################################## P
# Data can be stored in memory.
# There are two basic places: long term (hard drive) and short term (RAM).
# Data in long term storage will remain even if the program stops. It is a topic for another day.
# Short term storage disappears after the program stops. 
# Short term storage is both easy and essential. It works almost the same way in almost every language.
# In CoffeeScript, this is how it's done:

myData = "SomeData"
amIReallyAProgram = true
VALUE_FOR_PI = 3.141598
_A2d3f_ = "Bad Name" 
herp_derp = 1

# The word on the left is called a "variable", the equal sign is called the "assignment operator".
# Variables may be named whatever you like! So long as the name contains no spaces or math operators and doesn't start with a number.
# The naming convention for variables in most languages is "camelCase". First word lowercase, next words uppercase. 
# Note: For those who know JavaScript, 'var' is not allowed in CoffeeScript. 


######################################## P
# Variables can be used wherever you would use data

a = 1
print a  		


######################################## P
# When variables are used with a math operator, the variable names are replaced with their data before the math is resolved.

a = 2
print a+a 		# This becomes 'print 2+2' which becomes 'print 4'
print (a+a)*a 	# This becomes 'print (2+2)*2' which becomes 'print 8'


######################################## P
# The same applies during assignment:

a = 2
b = a+a+a  		# This becomes 'b = 2+2+2' which becomes 'b = 6'
print b + b 	# 'print 6+6' becomes 'print 12'

######################################## P
# When primitive data is assigned to a variable, the variable's old data is overwritten.

a = 1
a = 2 		# The 1 in memory is overwritten with the number 2.
a = a + a 	# becomes 'a = 2 + 2', then becomes 'a = 4'. Finally, the 2 that was in memory is overwritten with the number 4
print a


######################################## P
# Look very carefully. This part is tricky.

a = 1
b = a    # This line becomes 'b = 1'
		 # There are now two places in memory (labeled 'a' and 'b'). 
		 # 'a' and 'b' each has it's own unique number '1'. 
		 # The data for variable 'a' was duplicated. The copy was placed into variable 'b'.
		 # The variable 'b' does NOT point to the same memory that 'a' points to.
a = 2  	 # Changing the number in 'a' will not affect the data in 'b' or vice versa. 
print a
print b

# Note: This behavior holds for almost any programming language an interaction designer will encounter.
# Note: There is a huge exception to this rule that we will discuss later.



######################################## P
# In addition to primitive data types there are complex data types, or data structures.
# The most common type is an "Object". It is a kind of "Dictionary" made of word:Data pairs
# You can think of it as a collection of variables that are all attached to a larger variable.

pet = {}			# Here, the curly brackets are literally an Object, or, an "Object Literal"
pet.name = "Sam" 	# Here, we create a variable, 'name', "on the object".
pet.type = "Cat" 	# A variable on an object is called a "property"
					# the Object.Property notation is called "dot syntax".
					# It is common in many languages. 
					
print pet.name 		# We can use properties just like variables. Reading and writing to them.
print pet.type


######################################## P
# You can define an object's properties in the Object Literal like this:

pet = {name:"Sam",type:"Cat"}
print pet

# This is not uncommon.

######################################## P
# You can create nested object structures.

pet1 = {name:"Sam Jr."}
pet1.parent = {name:"Sam Sr."}
pet1.parent.parent = {name:"Ol papa Sam"}

print pet1.parent.name
print pet1.parent.parent.name


######################################## P
# CoffeeScript has a shorthand for creating objects.
# Instead of using curly brackets and commas, property:value pairs can go on a new line, with a tab-indent.
# This shorthand is commonly used in CoffeeScript code. 

pet = 
	name:"Sam"  # The one tab indentation is important. CofeeScript uses the white space to understand what is going on.
	type:"Cat"	# CofeeScript has what's called "significant whitespace". 		
	age:3 		# This is not the most common in different languages. But it is not unheard of.  
	parent:		
			name: "Sam Sr."		# Here we begin a new, nested object. 

print pet.name
print pet.type
print pet.age
print pet.parent.name


######################################## P
# Assigning Objects to variables is DIFFERENT from assigning primitive data to variables.
# The Object is stored in it's own memory area. 
# When an Object is assigned to a variable, the variable "point to" this memory.
# This means multiple variables can "point to" the same Object. 
# In such a case, modifying one variable's data can affect the other, because the data is the same.
# Again, this does not happen with primitive data.

clark = {power:"flight"}
superman = clark
print superman.power

superman.weakness = "kryptonite"
print clark.weakness


######################################## P
# If we assign primitive data to a variable that was pointing to an Object, the object data will NOT be overwritten.
# The variable will stop pointing to the Object, and will be allotted its own memory like normal.

clark = {power:"flight"}
superman = clark
clark = "Kent" 		
print clark
print superman



########################################
######################################## Functions
########################################

######################################## P
# In JavaScript and CoffeeScropt Functions are Objects too! Objects that store code.
# A function name is just a variable name, but one that points to code.

print(print) 

# Don't let the output freak you out. We don't normally do things like this. 


######################################## P
# We can write our own functions.
# In CoffeeScropt, a function (or a "function literal") looks like this:
-> print "clapping"

# This is also called a "function declaration"
# The "->" means "The code that follows is code for a function"
# Our function will not run until it is called though. Just like any other function...


######################################## P
# To call our function. We should store it using a variable.
# We can then call it like any other function.

applaud = -> print "clapping"
applaud()
applaud()
applaud()



######################################## P
# A function can have multiple lines of code, separated by semi-colons.

applaud = -> print "clapping"; print "clapping"; print "clapping";
applaud()


######################################## P
# OR... 
# You can write each line by itself, but with a tab-indent.
# This is the more common way of writing functions in CoffeeScript.

applaud = -> 
	print "clapping" 
	print "clapping"
	print "clapping"

applaud()

######################################## P
# You can write functions that take arguments like so

echo = (sound)-> # 'sound' works like a variable in the function. 
	print sound  # The data for sound will be set when the function is called.
	print sound  # You can use whatever unique name you want for this variable.

echo "Hello!" # When we can call our function with an argument, we can use the shortcut like normal.
			  # The string "Hello!" will be assigned to the variable 'sound' when the echo function code runs.



######################################## P
# Function can be written to accept multiple arguments:

echo = (sound1,sound2)-> 
	print sound1	
	print sound1	
	print sound2
	print sound2	
	

echo "Hello" , "Sam" 



######################################## P
# Some functions, when called, turn into, or "return", data.
# For example, the built in Number(DATA) function accepts primitive data, and returns a number.

a = Number("2")  # This becomes a = 2
print a+a 	 	 # This becomes  print 2+2


######################################## P
# Function calls that return data can be used anywhere you use data, even as arguments.
# When calling multiple functions at once, the calls are resolved from the inside out, like math.

print(Number("2"))  # 'Number("2")' is executed first.
print Number "2"  	# This means the exact same thing as the line above.


######################################## P
# WARNING! In CoffeeScropt, when using multiple function calls on the same line, best to use parenthesis.

print Number "2" + Number "2"   # Translates to 'print( Number("2"+Number("2") ))'  Oh noes!
print Number("2") + Number("2")	# Better



######################################## P
# In most languages, you can return data from a custom function by using the "return" keyword.

bake = (ingredient)->  
	results = ingredient + " pie"
	return results

print bake "apple"  # Translates to 'print(bake("apple"))'


######################################## P
# In CoffeeScript (and JavaScript), a custom function will always return a value.
# In CoffeeScript, by default, a function returns whatever data is on the last line.

bake = (ingredient)->  
	ingredient + " pie"
	
print bake "apple" 

# Tech Note: In JavaScript, if no value is explicitly returned using 'retun', the function returns the special value 'undefined'.

######################################## P
# A function can also be assigned to an object property.
# When a function belongs to an object like this, it is called a "method"

cat = {}
cat.eat = (food)->  
	print "I pooped "+ food	

cat.eat "kibbles" 



######################################## P
# We can define a method in the actual Object Literal.
# This gets messy though...

cat = {eat: ((food)->  print "I pooped "+ food)}

cat.eat "kibbles" 



######################################## P
# Better to use CoffeeScript's shortcut.

cat =
	eat:(food)->  
		print "I pooped "+ food	

cat.eat "kibbles" 


######################################## P
# In any language, in a method, you can refer to the Object that the method belongs to.
# In JavaScript and CoffeeScript, we use the keyword 'this'.

cat = 
	hairballs:10
	hork:->  
		this.hairballs = this.hairballs - 1


print cat.hairballs
cat.hork()
print cat.hairballs
cat.hork()
print cat.hairballs
cat.hork()
print cat.hairballs



######################################## P
# In CoffeeScript, "this." can be replaced with "@".
# The shortcut is very common in CoffeeScript code.

cat = 
	hairballs:10
	hork: ->  
		@hairballs = @hairballs - 1


print cat.hairballs
cat.hork()
print cat.hairballs
cat.hork()
print cat.hairballs
cat.hork()
print cat.hairballs



######################################## P
# In JavaScript and CoffeeScript, many built in functions are organized by being attached to an Object.
# For example, many mathematical functions are attached to the built in 'Math' Object.

print Math.round(3.14) 
print Math.cos(0)  		# Cosine of an angle
print Math.random() 	# Returns a number between 0 and 1



######################################## 
######################################## Note
######################################## 
#
# The print function is part of the FramerJS library.
# Normally, you'll want to use console.log() .
# Everything else in this document works anywhere you use CoffeeScript.
#
# End!
#
#
#

