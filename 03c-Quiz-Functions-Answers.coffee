###

	Quiz-Functions
	
###

######################################## Q1
# Create a function 'one' that prints the value 1

one = -> print(1)

#OR

one = ->
	print(1)




######################################## Q2
# Create a function 'bark' that, when run, prints "BARK" three times

bark = -> print("BARK"); print("BARK"); print("BARK");

#OR

bark = -> 
	print("BARK")
	print("BARK")
	print("BARK")

######################################## Q3
# Create a function that makes the output match what's described.

sayFive = -> print("Five") 

sayFive() 				#  "Five"


######################################## Q4
# Create a function called 'sum' that has two parameters, 'a' and 'b'
# The body only contains the comment '#TODO:Finish me'
# Call your function with the number arguments '2' and '2'

sum = (a,b) -> # TODO:Finish me

sum(2,2)


######################################## Q5
# Create a function called 'update' that has one parameter, 'point'
# Assume that point will be an object with the properties .x and .xVelocity
# Include this code in the function body: point.x = point.x + point.xVelocity
# After your function declaration, call your function with the argument {x:0,xVelocity:1}

update = (point) -> 
	point.x = point.x + point.xVelocity		#OR similar

update({x:0,xVelocity:1})


######################################## Q6
# Create a function that makes the output match what's described.

makeTwo = -> return 2 
# OR
makeTwo = -> 2  


days = makeTwo() 				
print days			#  "Two"


######################################## Q7
# Create a 'combine' function so that the results match what's described.

combine = (a,b)-> return a + b
#OR
combine = (a,b)-> a + b

print(combine(1,2)) 		#  3
print(combine(2,4)) 		#  6
print(combine(1,1)) 		#  2


######################################## Q8
# Create a 'combine' function so that the results match what's described.

combine = (obj)-> obj.a + obj.b + obj.c  # OR similar

combine({a:1,b:2,c:3})	# 6
	
combine
	a:1
	b:2
	c:3			# 6

combine
	a:5
	b:10
	c:15		# 30
	

######################################## Q9
# Create a 'makeBox' function so that the results match what's described.

makeBox = -> {x:0,y:0,width:100,height:100}

b = makeBox()
print(b.x) 	# 0 
print(b.y) 	# 0 
print(b.width) 	# 100
print(b.height) 	# 100


