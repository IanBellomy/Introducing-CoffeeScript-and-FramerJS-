###

	Quiz-Objects
	
###



######################################## Q1
# Create an object with x and y properties, each with the value 0, and assign the object to the variable box.

box = {x:0,y:0}

# OR

box =
	x:0
	y:0

######################################## Q2
# Create a variable 'block' and assign to it an object with no properties
# Aftwards, add two properties to it, width and height, each set to 10

block = {}				
block.width = 10
block.height = 10


######################################## Q3
# Write code that makes the output match what's described.

jonSnow = {knowledge:"nothing"}

print jonSnow.knowledge  	#  "nothing"


#OR

jonSnow = 
	knowledge:"nothing"

print jonSnow.knowledge  	#  "nothing"



######################################## Q4
# Q: What does this program print out?

dragon = {name:"Trogdor"}
print dragon.name	# A: "Trogdor"


######################################## Q5
# Q: What does this program print out?

robot = {name:"R2D2"}
robot.name = "C3PO"
print robot.name	# A: "C3PO"

######################################## Q6
# Q: What does this program print out?

wand =
	name:"Elder"
	owner:"Potter"
	length:15

print wand.owner # A: "Potter"


######################################## Q7
# Q: What does this program print out?

Agent = 
	name:"Eddie"
	alive:true

DoubleAgent = Agent
Agent.alive = false

print DoubleAgent.alive # A: false



######################################## Q8
# Q: What does this program print out?

name = "Bob"

guy1 = {name:"Ralf"}
guy2 = {name:"Sam"}

print name # A: "Bob"


######################################## Q9
# Create an object with three property value pairs, 
# where one of the values is another object with two property value pairs.
# (Your choice of names and values.) 

file =
	name:"Norman1.pdf"
	lastEdited:"1/10/2017"
	container:
		name:"Documents"
		lastEdited:"1/10/2017"


# OR

file =
	name:"Norman1.pdf"
	lastEdited:"1/10/2017"
	container:{name:"Documents",lastEdited:"1/10/2017"}

# OR

file = {name:"Norman1.pdf", lastEdited:"1/10/2017", container: {name:"Documents",lastEdited:"1/10/2017"}}

