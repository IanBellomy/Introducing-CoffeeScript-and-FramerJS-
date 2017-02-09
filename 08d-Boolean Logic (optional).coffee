###

	Intro to:
				
		• Boolean Logic
		
###
######################## P
# Instead of nesting if statements, we can use the logical 'and' operator.

hot = true
havePool = true

if hot and havePool  		# Expressions that use 'and' will resolve to true ONLY if BOTH the left and right side are true.
	print "Time to swim!"	# "If hot is true and havePool is true"

if hot						# The structure here is logically equivalent to the one above.
	if havePool
		print "Still time to swim!"

######################## P
# Note which comparisons are true and which are false

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
# We can combine 'and' with comparisons to express complex conditions. 

month = "march"
day = 15
inRome = true

if month == "march" and day == 15 and inRome
	print "Beware."




...

######################## P
# "Boolean logic" allows us to describe decision making.
# Before going further, here is a simple example in use.

clickCounter = 0
box = new Layer
box.onMouseDown ->
	clickCounter = clickCounter + 1
	if clickCounter == 3					# More on if statements later. 
		print "Third time is a charm!"	



