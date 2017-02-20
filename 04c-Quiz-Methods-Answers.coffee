###

	Quiz-Methods
	
###

######################################## Q1
# What does this program print?

robot =
	evil:true
	goal: -> print "EXTERMINATE"


print robot.evil	# "EXTERMINATE"
robot.goal()  		# "EXTERMINATE"


######################################## Q2
# What does this program print?

robot =
	power:10
	checkCharge: -> print @power
	
robot.checkCharge() # 10


######################################## Q3
# What does this program print?

robot =
	power:10
	work: -> 
		@power = @power-1
	

robot.work()
robot.work()
robot.work()
print robot.power 	# 7


######################################## Q4
# What does this program print?

power = 100
robot =
	power:10
	work: -> @power = @power-1
	

robot.work()
robot.work()
robot.work()
print power 	# 100

######################################## Q5
# What does this program print?

robot =
	power:10
	work: -> 
		@power = @power-1
		@used = true
	

robot.work()
print robot.used 	# true


######################################## Q6
# Create an object with a method 'cast' that when called results in "Boom!" being printed
# Assign the object to a variable 'wand'
# Call the wand's 'cast' method

wand =	
	cast: ->
		print "Boom!"


wand.cast()


######################################## Q7
# Create an object with a property 'cash' set to 0 
# and a method 'add' that has one parameter, 'money' 
# the 'add' method adds the money input to the object's cash property
# assign the object to the variable 'piggyBank'
# Call the piggyBank's add method and pass it the number 100
# Print how much cash is in the piggyBank

piggyBank = 
	cash:0
	add: (money) -> @cash = @cash + money

piggyBank.add(100)
print piggyBank.cash


######################################## Q8
# Create an object with a method such that the last line of the program has the described effect

wand =
	cast: (spell) -> print spell + "!"

wand.cast "Smell"   # "Smell!"


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


