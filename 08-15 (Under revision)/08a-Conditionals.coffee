###

	Intro to:
		
		• Comparison operators
		• Conditionals
		• Boolean Logic
	
	Note: These topics are large and will not be covered in full. What's here are the essential concepts. These alone are very flexible.

###

######################## P
# Some math symbols don't produce numbers, they produce true or false, or "Boolean" values.
# These symbols are called "comparison operators".

print 1 < 2		# "less than" 
print 1 > 2		# "greater than"
print 1 == 2	# "equal to", or, the "equivalence" operator.
				# The double equal equivalence operator is COMPLETELY DIFFERENT than the single equal "assignment" operator.
				# Mixing up the assignment and the equivalence operators is a very common early mistake, and one of the more tricky-to-see syntax gotchas in most languages. 

print 1 = 2     # Intentional typo. 
				# The mistake is using the assignment operator = instead of comparison operator ==. 
				# This will cause an error in most places. 


######################## P
# Boolean logic allows us to describe decision making.
# Before going further, here is a simple example in use.

clickCounter = 0
box = new Layer
box.onMouseDown ->
	clickCounter = clickCounter + 1
	if clickCounter == 3					# More on if statements later. 
		print "Third time is a charm!"	


######################## P
# Remember Functions?
# Functions are a kind of "flow control" statement; they move the execution (or the flow) of the program to a different part of the code. 
# Another kind of flow control statement is a "conditional statement". Comparisons and conditional statements go hand in hand. 
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

######################## P
# You can use variables as part of a comparison expression.

stay = 48		
leave = 52

if leave > stay
	print "Brexit!"


######################## P
# Usually, the result of the expression will depend on some circumstance. 
# Run this program multiple times and note the different results.

if Math.random() > 0.5 		# Note: Math.random() returns a value between 0 and 1. This resolves to something like 'if 0.129420 > 0.5' and then the comparison is made. 
	print "I got lucky!"	

print "done"

######################## P
# The equivalence operator can be used to see if two numbers are equal. 

month = 5				# Image we got this number from the clock. 
						# Note: In programming we almost always start counting at 0. 
isJune = month == 5     # You can think of this line 'isJune = (month == 5)' which becomes 'isJune = true'
print "Is June? " + isJune


######################## P
# The equivalence operator can be used to see if a value is false.
# 'false == false' resolves to 'true'

sick = false

if sick == false				
	print "Lets ride bikes!"


######################## P
# Note: While the equivalence operator can be used with booleans, it is not normally used to see if a value is true.
# If a variable holds a Boolean value, it will automatically resolve to true or false without the need for comparison

hungry = Math.random() > 0.5  	# The expression here will resolve to true or false, and that result will be assigned to the variable hungry

if hungry						# Here, there is no need to write 'if hungry == true'
	print "Feed me!"


######################## P
# The equivalence operator can be used to compare strings. 

name1 = "Sam"
name2 = "Sam"

if name1 == name2
	print "Name twins!"

# STOP: Go take a look at the last example in the previous document on Framer States. 


######################## P
# We can nest if statements to check multiple conditions.

hungry = true
isNoon = true

if hungry
	if isNoon
		print "Time to eat!"	# If one of the variables is false, the program will not reach this line


######################## P
# Instead of nesting if statements, we could also use "logical 'and' operator".
# This is the start of a topic called "Boolean Logic"

hot = true
havePool = true

if hot and havePool  		# Expressions that use 'and' will resolve to true ONLY if BOTH the left and right side are true.
	print "Time to swim!"


######################## P
# Note comparisons are true and which are false

print true and true
print true and false
print false and false

# Note: In most languages, the logical and operator is &&. This version exists in CoffeeScript too if you prefer.


######################## P
# We can chain together many 'and' comparisons in one expression. 

a = true
b = true
c = true
d = true

if a and b and c and d
	print "ok ok."

# 'and' is like addition, in that the order of each 'and' doesn't matter. 1+2+4 is just as good as 4+1+2 is just as good as (4+2)+1. 
# 'a and b and d and c' is just as good as '(a and d) and (c and b)'


######################## P
# We can combine 'and' with comparisons to produce complex conditional statements

month = "march"
day = 15
inRome = true

if month == "march" and day == 15 and inRome
	print "Beware."

