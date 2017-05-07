###

	Quiz-Methods
	
###

######################################## Q1
# What does this program print?

robot = {evil:true}
robot.goal = -> print("EXTERMINATE")


print(robot.evil)	# ?
robot.goal()  		# ?


######################################## Q2
# What does this program print?

robot = {power:10}
robot.checkCharge = -> print(this.power)
	
robot.checkCharge() #?


######################################## Q3
# What does this program print?

robot = {power:10}
robot.work = -> this.power = this.power-1
	

robot.work()
robot.work()
robot.work()
print robot.power 	# ? 


######################################## Q4
# What does this program print?

power = 100
robot = {power:10}
robot.work = -> this.power = this.power-1
	

robot.work()
robot.work()
robot.work()
print power 	# ? 

######################################## Q5
# What does this program print?

robot = {power:10}
robot.work: -> 
	this.power = this.power-1
	this.used = true
	

robot.work()
print(robot.used) 	# ? 




######################################## Q6
# Create an object with a method 'cast' that when called results in "Boom!" being printed
# Assign the object to a variable 'wand'
# Call the wand's 'cast' method







######################################## Q7
# Create an object with a property 'cash' set to 0 
# and a method 'add' that has one parameter, 'money' 
# the 'add' method adds the money input to the object's cash property
# assign the object to the variable 'piggyBank'
# Call the piggyBank's add method and pass it the number 100
# Print how much cash is in the piggyBank






######################################## Q8
# Create an object with a method such that the last line of the program has the described effect


# (code here)


wand.cast("Smell")   # "Smell!"



######################################## 
######################################## Intermediate
######################################## 

######################################## Q9
# Re-write this program WITHOUT CoffeeScript shortcuts

robot = 
	lasers:3
	power:10
	robot.fire: -> 
		@power -= @lasers
		

robot.fire()
print robot.power

######################################## Q10
# Re-write this program WITH CoffeeScript shortcuts

box = {x:0,y:0}
box.width = 100
box.height = 100
box.grow = ->
	this.width = this.width + 10
	this.width = this.width + 10
		



######################################## 
######################################## Advanced
######################################## 

######################################## Q11
# What does this program print?

ironMan = {flies:true}
tony = ironMan
tony.rich = true

print ironMan.rich	# ?


######################################## Q12
# What does this program print?

batman = {just:true}
bruce = batman
batman = "A legend"

print bruce.just	# ?


