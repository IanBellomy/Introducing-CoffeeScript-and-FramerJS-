###
	
	Brief introduction to CoffeeScript classes.	


	— Ian Bellomy, 2017

###


######################## P1
# A class is like a template for an Object.

class Cat				# Define a category of Objects called Cat
	hairballs:10		# All Cat objects will have hairball property
	hork:->				# All Cat objects will have a hork() method
		print "HORK"
	
# An Object based on a class is called an "instance". We create instances like this:
hobbes = new Cat()


# An instance has all the methods and properties defined by its class. 
hobbes.hork()
print hobbes.hairballs 


# Tech Note: If you're familiar with JavaScript, you may be asking, "How does CoffeeScript have classes if it compiles to JavaScript, which does not have classes?" 
# Answer: Shinanigans. Just roll with it. 

######################## P2
# Classes in CoffeeScript can have a special 'constructor' method.
# This method will be called, automatically, when a new instance is created.

class Robot			
	constructor:->			
		print "I'm Alive!"
		

r = new Robot() 

######################## P3
# Constructor methods can accept arguments.
# This can be a handy way to set some options when creating an instance.

class Robot			
	constructor:(givenName)->			
		print "I'm Alive!"
		print "My name is " + givenName
		@name = givenName	# The '@' refers to the specific instance of Robot being constructed
							# not the Robot class
							# This allows us to refer to the object being made when it is being made. 
		

r = new Robot "Johnny"  # Note that we can omit the parenthesis like with normal function calls. 
print r.name


######################## P4
# Construtor methods can accept objects as arguments.

class Box			
	constructor:(size)->			
		@w = size.width
		@h = size.height
		@d = size.depth
	
	getVolume:->
		return @w*@h*@d

b1 = new Box({width:10,height:10,depth:10})
b2 = new Box({width:20,height:20,depth:20})

print b1.getVolume()
print b2.getVolume()



######################## P5
# The same exact same program using shortcuts.

class Box			
	constructor:(size)->			
		@w = size.width
		@h = size.height
		@d = size.depth
	
	getVolume:->
		@w*@h*@d 	#The results of this math are automatically returned


b1 = new Box		# This approach is VERY common to CoffeeScript
	width:10
	height:10
	depth:10

b2 = new Box
	width:20
	height:20
	depth:20

print b1.getVolume()
print b2.getVolume()

