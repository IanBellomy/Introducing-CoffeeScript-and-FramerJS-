###

	Quiz-Functions
	
###

######################################## Q1
# Create a function 'one' that returns the value 1

one = -> return 1

#or

one = -> 1

######################################## Q2
# Create a function 'bark' that, when run, prints "BARK" three times

bark = ->
	print("BARK")
	print("BARK")
	print("BARK")

#or

bark = -> print("BARK");print("BARK");print("BARK")


######################################## Q2
# Create a function that makes the output match what's described.

getFive = -> return 5

print(getFive()) 		#  5


######################################## Q3
# Create a function that makes the output match what's described.

sayFive = -> print("Five")

sayFive() 				#  "Five"


######################################## Q4
# Create a function that makes the output match what's described.

sayTwo = -> 2

days = sayTwo() 				
print days			#  "Two"


######################################## Q5
# Create a 'combine' function so that the results match what's described.

combine = (a,b) -> a+b

print combine(1,2) 		#  3
print combine(2,4) 		#  6
print combine(1,1) 		#  2


######################################## Q6
# Create a 'combine' function so that the results match what's described.

combine = (obj) -> obj.a + obj.b + obj.c

combine({a:1,b:2,c:3})	# 6
	
combine
	a:2
	b:4
	c:6			# 12

combine
	a:5
	b:10
	c:15		# 30


######################################## Q7
# Create a 'makeBox' function so that the results match what's described.

makeBox = -> {x:0}

box = makeBox()
print box.x 	# 0 


