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
# 'and' is a logical operator (like < or > or == ) that evalutaes to 
# true if the item on the left is true AND the item on the right is true. 
# Look carefully at which of these is true.

print true and true
print true and false
print false and false

# Note: In most languages, the logical 'and' operator is '&&', but it works exactly the same.
# You can also use '&&' in CoffeeScript if you prefer.


######################## P
# We can chain together several  'and' comparisons in one expression. 
# Like addition, the order is irrelevant.

a = true
b = true
c = true
d = true

if a and b and c and d   	# Essentialy, this checks to see if a,b,c,d are all true.
	print "ok ok."

if b and c and a and d      # Same result as above.
	print "ok ok."

if (a and d) and (b and c)  # Same result as above.
	print "ok ok."

if ((a and d) and b) and c  # Same result as above.
	print "ok ok."


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



