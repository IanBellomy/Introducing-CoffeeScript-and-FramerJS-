
# Crash course in Loops and Arrays

################################# P

# Make some layers
a = new Layer
	height: 50

b = new Layer
	height: 50
	y:100
	
c = new Layer
	height: 50
	y:200
	
	
# Next we create an "Array"
# An array is basically a list.
# Technically, it's another kind of complex or structured data)
list = [a,b,c] # We use square brackets instead of curly brackets

# By itself, an array doesn't too much for us.
# It's super useful with it's best friend "loop"

# Below is a "for in" loop.
# 'For each element in the list, do the indented code'
for item in list
	# Each time this indented code runs, the variable 'item' will refer to an element in our array.	
	# Because our array has three items, this indented code will run three times
	# We can do whatever we want in this indented code, including adding event listeners
	print item	# print each item
	item.rotation = 45	# rotate each item
	item.onMouseOver -> @animate({scale:1.5})	# add an event listener to each item
	item.onMouseOut -> @animate({scale:1})	# add another event listener to each item




################################# P
# We can use an array of numbers with a loop to make a lot of things at once.
list = [0,1,2,3,4,5,6,7,8,9,10]
for n in list
	new Layer
		height:10
		width:10		
		y:n*11		# we can use each number to do snarky things, like setting positions using math.
		

################################# P
# Coffeescript has very useful shortcut for making big arrays of numbers
numbers = [0...50] # this creates an array filled with numbers 0 to 50 inclusive
for n in numbers
	new Layer		
		width:n
		height:10				
		y:n*11
		

################################# P
# We can save lines by using the raw array right in our loop expression
# (This program is the same as the above)
for n in [0...50]
	new Layer
		width:n
		height:10
		y:n*11

