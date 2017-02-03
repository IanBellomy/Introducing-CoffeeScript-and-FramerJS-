###
	
	Classes.	

	We won't make classes very often, but we will use _existing_ classes a lot. 
	Knowing a little about what a class is and how they are built will make it easeier to understand how to use pre-made classes.


###


######################## P1
# A class is like a template for an Object.
# By convention, Class names start with an Uppercase letter.

class Cat				# Define a category of objects called Cat. Note the use of Uppercase in the name.
	hairballs:10		# All Cat objects will have hairball property
	hork:->				# All Cat objects will have a hork() method
		print "HORK"
	
# An object based on a class is called an "instance". We create instances like this:
hobbes = new Cat() # Create an instance of 'Cat'
mittens = new Cat()
# By convention, instance names start with a lowercase letter.

# An instance has all the methods and properties defined by its class. 
hobbes.hork()
print hobbes.hairballs 
print mittens.hairballs

# Tech Note: If you're familiar with JavaScript, you may be asking, "How does CoffeeScript have classes if it compiles to JavaScript, which does not have classes?" 
# Answer: Shinanigans. Just roll with it. 


######################## P2
# Classes in CoffeeScript can have a special 'constructor' method.
# This method will be called, automatically, when a new instance is created.
# Other languages have similar mechanisms, though the might be called something like 'init'

class Robot			
	constructor:->			
		print "I'm Alive!"
		

r = new Robot() 

######################## P3
# Constructor methods can accept arguments.
# This can be a handy way to set options when creating an instance.

class Robot			
	constructor:(givenName)->			
		print "I'm Alive!"
		print "My name is " + givenName
		@name = givenName	# The '@' refers to the specific instance of Robot being constructed
							# not the Robot class
							# This allows us to refer to the object being made when it is being made. 
		

r = new Robot "Johnny"  # Note that we can omit the parenthesis like with normal function calls. 
print r.name

# Technically, when we create an instace, we're calling a function that returns an object.


######################## P4
# In coffeeScript
# When creating an instace, we can leave off the parenthesis even if we don't provide an argument.

class Derp
	isADerp:true

d = new Derp	# the 'new' keyword is enough of a context clue for CofeeScript to know what's going on.
print d


######################## P4
# Construtor methods can accept objects as arguments.
# This allows us to provide input without having to memorize the order that arguments need to go in.

class Box			
	constructor:(size)->			
		@w = size.width
		@h = size.height
		@d = size.depth
	
	getVolume:->
		return @w * @h * @d

b1 = new Box({width:10,height:10,depth:10})
b2 = new Box({height:20,depth:20,width:20})

print b1.getVolume()
print b2.getVolume()



######################## P5
# The same exact same program using object notation shortcuts.

class Box			
	constructor:(size)->			
		@w = size.width
		@h = size.height
		@d = size.depth
	
	getVolume:->
		@w * @h * @d 	#The results of this math are automatically returned


b1 = new Box		# This approach is VERY common to CoffeeScript and Framer. Study carefully.
	width:10
	height:10
	depth:10

b2 = new Box
	width:20
	height:20
	depth:20

print b1.getVolume()
print b2.getVolume()

######################## 
######################## End / Note
######################## 
###
	
	Classes allow developers to create complex and reuseable building blocks. 
	Libraries and frameworks are just complex collections of useful functions and classes.
	Framer is itself such a framework.

###
