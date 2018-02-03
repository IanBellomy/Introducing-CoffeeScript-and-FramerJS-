###

	Quiz-Functions

	(If your answers are a little different because you are using shorthand, that's totally ok.)
	
###


######################################## Q1
# Create a function so that rest of the code behaves as described.

sayFive = -> print("Five")

sayFive() 				#  "Five"


######################################## Q2
# Create a function so that rest of the code behaves as described.

count = ->
	print(1)
	print(2)
	print(3)

count() 	# 1
			# 2
			# 3


######################################## Q3
# Fix the code so it works as described

doIt = -> "DONE!"

doIt() 	 # "DONE!"
			

######################################## Q4
# Fix the code so it works as described.

alert = (message)->
	print(message)

alert("LOOK OUT!")			# "LOOK OUT!"
alert("ITS A TRAP")			# "ITS A TRAP!"


######################################## Q5
# Create a function so the code works as described.

# A: Something like this. Your parameter may be named differently.
select = (food) ->
	print(food)
	print("Selected")

select("Tuna")			# "Tuna"
						# "Selected"

select("Fritos")		# "Fritos"
						# "Selected"

select("Burritos")		# "Burritos"
						# "Selected"


######################################## Q6
# Create a function so that the code works as described.

# A: Something like this. Your parameter may be named differently.
countFrom = (start)->
	print(start)
	print(start+1)
	print(start+2)

countFrom(1) 	# 1
				# 2
				# 3

countFrom(10) 	# 10
				# 11
				# 12


######################################## Q7
# Create a function 'one' that prints the value 1 when called. Call the function.

one = -> print(1)
one()


######################################## Q8
# Create a function called 'add' that has two parameters:	a and b. 
# The body of the function contains the code: a + b
# Call your function with the arguments 2 and 2

add = (a,b) -> a + b
add(2,2)

######################################## Q9
# Write two functions for this program so that it works as described.

box = new Layer

down = -> print("HEY!")
up = -> print("OUCH!")

box.onMouseDown(down)		# When the box is pressed the word "HEY!" should be printed.
box.onMouseUp(up)			# When the box is released the word "OUCH" should be printed.


