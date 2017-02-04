###

	The following quizzes are optional.

	They involve advanced uses of functions and methods. 


	note:
		functions are objects
		we can move them around just like any kind of data

	Many of these programs invovle techniques... 		


###

######################## Q1
# Create a function 'decorate' with accepts one argument. 
# Assume the input will be an object.
# In 'decorate's body create code such that a method 'sparkle' is aadded to the input.




######################## Q2
# What does this program print out?
# (Remember that functions can accept objects as arguments.)
# (Remember that methods can be added after the creation of the object.)

rat = {}
trainChef rat
rat.cook()			# "Soup's up!"



######################## Q3
# Create a function 'instructor' that returns the function print, (but does not call print.)
# Seperately, call instructor with no arguments 
# AND THEN call the function that instructor returns with the argument "ok"



######################## Q4
# Complete the top of the program so that it works as described
# (Remember that function calls in an expression are resolved first.)

# (Code here)

print makeAnt().legs	# 6		


######################## Q5
# Complete the top of the program so that it works as described

# (Code here)

bob = newBug 6
bill = newBug 8
print bob.legs 		# 6
print bill.legs 	# 8 


######################## Q6
# Complete the top of the program so that it works as described

# (code here)

sam = newCat()
sal = newCat()

sam.feed()

print sam.hungry   # false
print sal.hungry   # true


######################## Q7
# Create a function 'employ' that accepts one argument 'fn', assume that fn will be a function
# in the body, call the input function





######################## Q8
# Create a program that makes the program work as described
# (Remember: a function is an object)
# (Remember: functions can accept objects as arguments)
# (Remember: code in a function body can call a function)

# (code here)

horn()			# "HONK!"
honk horn		# "HONK!"


######################## Q9
# Create a program that makes the program work as described
# (Remember: a function is an object)
# (Remember: functions can -return- objects)
# (Remember: If multiple operations are equivalent in importance, they are resolved left to right)

# (code here)

newGreeting()()		# "Hi"




######################## Q10
# This doesn't work

brokenCountDown 4	# 4
					# 3
					# 2
					# 1
					# 0
					# -1
					# -2
					# ... program will eventually freeze and stop.



######################## Q11

# This is dumb

# Create a program that makes the program work as described
# (Remember: a function is an object)
# (Remember: functions can -return- objects)
# (Remember: If multiple operations are equivalent in importance, they are resolved left to right)


# (code here)

americanHello 	= newGreeting("Hi")
spanishHello 	= newGreeting("Saludo")

americanHello() 				# "Hi"
spanishHello() 					# "Saludo"

