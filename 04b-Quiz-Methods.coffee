###

	Quiz-Methods
	
###

######################################## Q1
# What does this program print?

robot =
	evil:true
	goal: -> print "EXTERMINATE"


print robot.evil	# ?
robot.goal()  		# ?


######################################## Q2
# What does this program print?

robot =
	power:10
	checkCharge: -> print @power
	
robot.checkCharge() #?


######################################## Q3
# What does this program print?

robot =
	power:10
	work: -> @power = @power-1
	

robot.work()
robot.work()
robot.work()
print robot.power 	# ? 


######################################## Q4
# What does this program print?

power = 100
robot =
	power:10
	work: -> @power = @power-1
	

robot.work()
robot.work()
robot.work()
print power 	# ? 

######################################## Q5
# What does this program print?

robot =
	power:10
	work: -> 
		@power = @power-1
		@used = true
	

robot.work()
print robot.used 	# ? 


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


wand.cast "Smell"   # "Smell!"


######################################## Q9
# What does this program print?

ironMan = {flies:true}
tony = ironMan
tony.rich = true

print ironMan.rich	# ?


######################################## Q10
# What does this program print?

batman = {just:true}
bruce = batman
batman = "A legend"

print bruce.just	# ?


