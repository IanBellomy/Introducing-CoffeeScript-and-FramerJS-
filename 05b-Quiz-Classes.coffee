###

	Quiz-Classes
	
###

######################################## Q1
# What does this program print?

class Dog
	barks:true
	bites:false

bruce = new Dog
bud = new Dog
bud.bites = true

print bruce.bites	# ?
print bud.bites		# ?


######################################## Q2
# What does this program print?

class Dog
	tired:false
	bark: ->
		print "ARF! ARF! ARF! ARF!"
		@tired = true
	rest: ->
		@tired = true


bruce = new Dog
bud = new Dog
bud.bark()			# ?
print bruce.tired	# ?
bud.rest()
bruce.bark()			
print bud.tired		# ?




######################################## Q3
# Write a 'Duck' class so that the final line works as described.

# (Code here)

duck = new Duck
duck.quack()	# "QUACK!""


######################################## Q4
# Write a 'Square' class so the final lines work as described.

# (Code here)

b1 = new Square
	width:10
	height:1

b2 = new Square
	width:2
	height:2

print b1.area()		# 10
print b2.area()		# 4



######################################## Q5
# Create a 'Point' class with a constructor that accepts two inputs, 'x' and 'y'
# These inputs get assigned to the properties x and y 
# Create a method 'sum' for the 'Point' class that returns the sum of its x and y values





######################################## Q6
# What does this program print?

class Robot
	power:10

r1 = new Robot
r2 = new Robot

r1.charge = -> @power = 100
r1.charge()

print r1.power	# ?
print r2.power	# ?



######################################## Q7
# What does this program print?

class Robot
	constructor:(configuration)->	
		@evil   = configuration.evil

blueprint = 
	evil:false
	
r1 = new Robot blueprint
r2 = new Robot blueprint
r2.evil = true	

print r1.evil	# ?	

s.evil = true

print r1.evil	# ?	

