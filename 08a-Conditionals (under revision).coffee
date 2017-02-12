###

	Intro to:
		
		• Comparison operators
		• Conditionals
		• Boolean Logic (Optional) <- this should be removed
	

	Preface:
		
		We can make the computer do different things in different circumstances.
		To do this we need to make comparisons and write branching if/then instructions.
		But most of all, we need to work with the values 'true' and 'false'.


###

######################## P1
# Some math operators don't produce numbers, they produce true or false. "Boolean" values.
# These kinds of operators are called "comparison operators". 
# We can use comparison operators to ask questions like 'is a more than b?'

print 1 < 2		# Is 1 less than 2?
print 1 > 2		# Is 1 greater than 2?

print 1 == 2	# Is 1 equivalent to 2?				
				# Note: The double equal "equivalence" operator is COMPLETELY DIFFERENT than the single equal "assignment" operator.
				# Mixing up the assignment and the equivalence operators is a very common early mistake, so keep an eye out.

print 1 = 2     # Intentional typo. 
				# The mistake is using the assignment operator = instead of comparison operator ==. 
				# This will cause an error in most places. 



######################## P2
# Remember Functions?
# Functions are a kind of "flow control" statement; they move the execution (or the flow) of the program to a different part of the code. 
# Another kind of flow control statement is a "conditional statement". 
# The most common kind of conditional statement is the 'if' statement.
# The if statement includes the if "keyword", the "expression" to check, and the "body" of code that may or may not be run

if true				# The "expression" after the 'if' can be anything (operations, variables, function calls) that resolve to true or false. 
	print "I run"	

if false			# We never write a raw boolean value in an if statement, but the expression must always resolve to a single boolean value.  
	print "Skip"

if 1<2					# 'if 1<2' resolves to 'if true'...
	print "I also run"	# ... and the code in the "body" will run.	

if 1>2 					# 'if 1>2' Resolves to 'if false' and so the body will not run.
	print "Skip"


if (1+20)<(20*20)  # Here, the normal math is done first, which resolves to 'if 21 < 400' which resolves to 'if true'. 
	print "I run after math."

######################## P3
# You can use variables as part of a comparison expression.

stay = 48		
leave = 52

if leave > stay
	print "Brexit!"


######################## P4
# Usually, the result of the expression will depend on some circumstance. 
# Run this program multiple times and note the different results.

if Math.random() > 0.5 		# Note: Math.random() returns a value between 0 and 1. This resolves to something like 'if 0.129420 > 0.5' and then the comparison is made. 
	print "I got lucky!"	

print "done"


######################## P5
# The equivalence operator can be used to see if two numbers are equal. 

month = 5				# Imagine we got this number from the computer's clock. 
						# Note: In programming we almost always start counting at 0. 
isJune = month == 5     # You can think of this line 'isJune = (month == 5)' which becomes 'isJune = true'
print "Is June? " + isJune


######################## P6
# The equivalence operator can be used to see if a value is false.
# Heads up! 'false == false' resolves to 'true' because false is equivalent to false.

sick = false

if sick == false				
	print "Lets ride bikes!"


######################## P7
# Note: This is redundent.

healthy = true

if healthy == true						# We can just write 'if healthy'
	print "Lets ride bikes!"


######################## P8
# Another example

hungry = Math.random() > 0.5  	# The expression here will resolve to true or false, and that result will be assigned to the variable hungry

if hungry						# Here, there is no need to write 'if hungry == true'
	print "Feed me!"


######################## P9
# The equivalence operator can be used to compare strings. 

name1 = "Sam"
name2 = "Sam"

if name1 == name2
	print "Name twins!"



######################## P10
# The 'not equivalent' operator can be used to see if two things are not equivalent.

flavor = "vanilia"
myFavorite = "chocolate"

if flavor != myFavorite
	print "Do not want."



######################## P11
# We can put any code we want in a conditional's body, including more conditionals
# This way we can check multiple conditions with nested if statements. 

hungry = true
isNoon = true

if hungry						# If hungry is true, go into the body, otherwise skip the next two lines
	if isNoon					# If isNoon is true, go to the body, otherwise skip the next line. 
		print "Time to eat!"	# If one of either of the variables is false, the program will not reach this line
								# Note the indentation.


########################
########################	Forks in the road:  if/else
########################


######################## P12
# 'If' statments can branch into two or paths using the keyword 'else'
# In the case of branching statements, either the 'if' body runs, or the 'else' body runs. Never both.
# After one part or the other runs the program resumes after the if/else statement.


if 0.5 < Math.random()
	print "win"				# Sometimes this code runs.
else			
	print "loose"			# Sometimes this code runs.

print "done."				# This code always runs.
							# Run this program multiple times to see different results.



######################## P13
# Here we use if/else to pick a random color

if 0.5 < Math.random()
	l.backgroundColor = "red"
else			
	l.backgroundColor = "black"


######################## P14
# We can create multiple branches using 'else if'

spotted = "wildlings"					# Try changing this to other strings. 

if spotted == "friend"					
	print ("TOOT")
else if spotted == "wildlings"			# Note that this is 'else if'	
	print ("TOOT TOOT")
else if spotted == "white walkers"		# You can have as many 'else if's as you'd like
	print ("TOOT! TOOT! TOOT!")			
else									# if the first 'if' and the following 'else if' expressions are false.
	print ("...")						# the 'else' code will run by default. 										
										# There can be no more than one 'else' because there can no more than one default.
										# You are not required to end on else though.


######################## P15
# We can use variables and conditionals to respond to the same action in different ways. 

b = new Layer
clicks = 0
b.onMouseDown ->
	clicks = clicks + 1
	if clicks == 1
		@html = "Ow."
	else if clicks == 2
		@html = "Stoppit!"
	else if clicks == 3
		@html = "I die!"
	else if clicks > 3
		@html = "..."	


######################## P15
# A toggle button is a good example of something that 
# responds in different ways depending on the situation.

toggleButton = new Layer
	backgroundColor: "gray"
	
selected = false

toggleButton.onMouseDown ->
	if selected == false
		selected = true
		@backgroundColor = "lightGreen"
		
	else if selected
		selected = false
		@backgroundColor = "gray"


######################## P15
#  Other variable responses.. . .
# shrink until we stop?
# recusion in functions
# do something until N
#



######################## P15

countDown = (n)->
	print n
	if n > 0 
		countDown(n - 1)

countDown(100)



