###
	
	Brief introduction to CoffeeScript classes.


	— Ian Bellomy, 2016

###


########################
# A class is like a template for an Object.

class Cat			# Define a category of Objects called Cat
	hairballs:10		# All Cat objects will have hairball property
	hork:->			# All Cat objects will have a hork() method
		print "HORK"
	
# An Object based on a class is called an "instance". We create instances like this:
hobbes = new Cat()


# An instace has all the methods and properties defined by its class. 
hobbes.hork()
hobbes.hork()
print hobbes.hairballs 


# Tech Note: If you're familiar with JavaScript, you may be asking, "How does CoffeeScript have classes if it compiles to JavaScript, which does not have classes?" 
# Answer: Shinanigans. Just roll with it. 

########################
# Classes can have a special 'constructor' method.
# This method will be called, automatically, when a new instance is created.

class Robot			
	constructor:->			
		print "I'm Alive!"
		

r1 = new Robot()


########################
# Construtor methods can accept arguments.
# This can be a handy way to set some options when creating an instance.

class Robot			
	constructor:(givenName)->			
		print "I'm Alive!"
		print "My name is " + givenName
		@name = givenName
		

r1 = new Robot()
print r1.name


