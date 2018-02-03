###
		
	The programs in this document introduce: 
		
		• Methods		

###

######################################## P1
# A method is just a function attached to an object.
# In other words a property is a type of variable like a method is a type of function.

cat = {}
cat.meow = -> 
	print("mewwww!")
cat.meow()  # Methods are called just like functions, because they are functions.   "mewwww!"  

meow()		# ERROR. There is no meow function out in the open, only on the cat object. meow by itself refers to nothing! 


######################################## P2
# Methods can have parameters that accept arguments, just like normal functions.

cat = {}
cat.eat = (food) -> 
	print("I pooped " + food)	# (For a refresh on how + behaves with strings see 01a-variables.pdf, P6)

cat.eat("kibbles")  # "I pooped kibbles"


######################################## P3
# Methods are special in one way though, they can refer to the object they belong to using the keyword 'this'. 
# In a method 'this' refers to the object the method is attached to.


player = {health:100,name:"Bob"}
player.explode = -> 
	this.health = 0 
	print(this.name + " is dead!")

print(player.health)	# 100
player.explode()		# "Bob is dead!"
print(player.health)	# 0


######################################## P4
# Another example.

cat = {name:"Mittens"}
cat.meow = ->  	
	print(this.name + " wants pets")	

cat.meow()  		# "Mittens wants pets"
cat.name = "Biff"	# Change the value of the name property
cat.meow()  		# "Biff wants pets"		


######################################## P5
# For comparison, note how the function below accesses and modifies a variable out in the open.

points = 0
		
catchSnitch = ->
	points = points + 150

print(points)		# 0
catchSnitch()
print(points)		# 150



######################################## P6
# Here's an example using a Layer.

box = new Layer()
box.scoot = -> this.x = this.x + 20		
box.onMouseDown(box.scoot) 				# Click the box to scoot it 20pt to the right from wherever it is.



######################################## 
######################################## Shorthand [ optional ]
######################################## 

######################################## P7
# In CoffeeScript we can substitute the @ symbol for 'this.'
# Note that @ takes the place of this AND the dot afterwards.

box = new Layer()
box.scoot = -> @x += 20			# For a refresher on '+=' see 01a-variables, P13
box.onMouseDown(box.scoot)


######################################## P8
# You can define a method when using CoffeeScript's Object Literal shorthand.
# You can call a method using CoffeeScript's function call shorthand.

cat = 				# new variable cat set equal to...
	name:"mittens"	# ...a new object, beginning with its first property:value pair
	age:10			# another property:value pair
	eat:(food)->  	# method declaration
		print "I pooped " + food	# method body

print cat.name		# If we call a method with an argument, we can omit the parenthesis just like with normal functions.
print cat.age
cat.eat "kibbles" 


######################################## 
######################################## End
######################################## 