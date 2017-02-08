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

print bruce.bites	# false
print bud.bites		# true


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
bud.bark()			# "ARF! ARF! ARF! ARF!"
print bruce.tired	# false
bud.rest()
bruce.bark()		# "ARF! ARF! ARF! ARF!"
print bud.tired		# true




######################################## Q3
# Write a 'Duck' class so that the final line works as described.

class Duck
	quack:->
		print "QUACK!"

duck = new Duck
duck.quack()	# "QUACK!"


######################################## Q4
# Write a 'Square' class so the final lines work as described.

class Square
	constructor:(size)->
		@w = size.width
		@h = size.height

	area:->
		@w * @h

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

class Point
	constructor:(x,y)->
		@x = x
		@y = y

	sum:->
		@x + @y



######################################## Q6
# What does this program print?

class Robot
	power:10

r1 = new Robot
r2 = new Robot

r1.charge = -> @power = 100
r1.charge()

print r1.power	# 100
print r2.power	# 10



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

print r1.evil	# false

blueprint.evil = true

print r1.evil	# false

