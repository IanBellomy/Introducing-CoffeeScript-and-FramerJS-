###

	Quiz-Methods
	
###

######################################## Q1
# What does this program print?

robot = {evil:true}
robot.goal = -> print("EXTERMINATE")


print(robot.evil)	# true
robot.goal()  		# "EXTERMINATE"


######################################## Q2
# What does this program print?

robot = {power:10}
robot.checkCharge = -> print(this.power)
	
robot.checkCharge() # 10


######################################## Q3
# What does this program print?

robot = {power:10}
robot.work = -> this.power = this.power-1
	

robot.work()
robot.work()
robot.work()
print robot.power 	# 7 


######################################## Q4
# What does this program print?

power = 100
robot = {power:10}
robot.work = -> this.power = this.power-1
	

robot.work()
robot.work()
robot.work()
print power 	# 100

######################################## Q5
# What does this program print?

robot = {power:10}
robot.work = -> 
	this.power = this.power-1
	this.used = true
	

robot.work()
print(robot.used) 	# true


######################################## Q6
# Create a variable called 'wand' to refers to an object
# with a method 'cast' that when called results in "Boom!" being printed

# Call the wand's 'cast' method

wand = {}	
wand.cast = ->
	print("Boom!")

wand.cast()

# OR

wand =	
	cast: -> print "Boom!"

wand.cast()



######################################## Q7
# Create an object with a method such that the last line of the program has the described effect

wand = {}
wand.cast: (spell) -> print(spell + "!")

wand.cast "Smell"   # "Smell!"

# OR

wand = 
	cast : (spell) -> 
		print spell + "!"

wand.cast "Smell"   # "Smell!"

# OR similar





######################################## Q8 (tricky)
# Create an object with a property 'cash' set to 10 
# and a method 'add' that has one parameter, 'money' 
# The 'add' method adds the money parameter to the object's cash property, so that the cash property is changed
#
# Assign this object to the variable 'piggyBank'
# Call the piggyBank's add method and pass it the number 100
# Print how much cash is in the piggyBank

piggyBank = {cash:10}
piggyBank.add = (money) -> this.cash = this.cash + money

piggyBank.add(100)
print(piggyBank.cash)

# OR

piggyBank = 
	cash:10
	add: (money) -> 
		@cash += money

piggyBank.add(100)
print(piggyBank.cash)

# OR similar


######################################## 
######################################## Intermediate
######################################## 

######################################## Q9
# Re-write this program WITHOUT CoffeeScript shortcuts

# Solution:

robot = {lasers:3,power:10}
robot.fire = -> this.power = this.power - this.lasers
		
# OR similar

######################################## Q10
# Re-write this program WITH CoffeeScript shortcuts

# Solution:

box = 
	x:0
	y:0
	width:100
	height:100
	grow: ->
		@width = @width + 10
		@width = @width + 10


########################################
######################################## Advanced
########################################

######################################## Q9
# What does this program print?

ironMan = {flies:true}
tony = ironMan
tony.rich = true

print ironMan.rich		# true


######################################## Q10
# What does this program print?

batman = {just:true}
bruce = batman
batman = "A legend"

print bruce.just	# true
print batman.just 	# undefined

