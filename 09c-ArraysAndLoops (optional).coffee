###

 
 	• Brief intro to Arrays and Loops


	Arrays and Loops are essential anytime you want to modify many things at once.


###

################################# P1
		

# An array is basically a list.
list = ["a","b","c"] # We use square brackets instead of curly brackets.
# Technically, it's another kind of structured data, like an object.
# But instead of name:value pairs, we have numbered items.

# We can access items in the list like so:
print(list[0]) # "a"	The number in the brackets is called the 'index'.	
print(list[1]) # "b"
print(list[2]) # "c"

# Note that index 0 is the first item, 1 is the second, and 2 is the third
# In almost every language, the first item in a list is item zero.

# 	 [a, b, c, d, e, f]		# a hypothetical array
#	  0	 1 	2  3  4	 5 		# The index values


# Basically, each slot of an array is a variable, and we can treat it as such. 
# We can overwrite the data in these slots like so:

list[0] = "cat"
print(list) # ["cat","b","c"]



################################# P2
# By itself, an array doesn't do much. It's innert like an object.
# But, it's super useful with its best friend "loop".

# Make some layers
a = new Layer
	height: 50

b = new Layer
	height: 50
	y:100
	
c = new Layer
	height: 50
	y:200
	

# Make an array of our layers. PS. we can put any data we want in an array
list = [a,b,c] 

# Below is a "for in" loop.
# 'For each element in the list, do the indented code'
for item in list
	# Each time this indented code runs, the variable 'item' will refer to an element in our array.	
	# Because our array has three items, this indented code will run three times	
	print(item)	# print each item
	item.rotation = 45	# rotate each item
	item.onMouseOver -> @animate({scale:1.5})	# add an event listener to each item
	item.onMouseOut -> @animate({scale:1})	# add another event listener to each item

################################# P3
# Unlike some other languages, in CoffeeScript, if we want to use a loop, we need an array.
# But we can use an array of numbers.

for n in [0,1,2,3,4,5,6,7,8,9,10]
	new Layer
		height:10
		width:10		
		y: n * 11		# we can use each number to do visual things, like setting positions using math.
		

################################# P4
# In these cases, we don't need to write out the full array of numbers though
# CoffeeScript and some other languages have a useful shortcut '...' to express a range of values.

for n in [0...10] # The '...' tells the computer to fill in the values in between 0 and 50
	new Layer		
		width:n
		height:10				
		y: n * 11
		

################################# P5
# We can use a loop to create a bunch of layers and save the layers in an array for use later

layers = []

for n in [0...50]
	layers[n] = new Layer
		width:10
		height:10
		x:Align.center
		y: n * 11

	layers[n].onMouseOver ->
		# When this handler function runs, later, on roll over
		# the layers array will be full of layers		
		for layer in layers	# for each layer in that layers array
			layer.animate 	# animate it
				rotation:45	

	layers[n].onMouseOut ->
		for layer in layers
			layer.animate
				rotation:0

# In other words
# Make an empty array. We'll use it to hold layers
# Do the following 50 times:
#	make a layer and add it to the layers array at slot n
#	when the layer is moused over, do the following:
#		for every layer in the layer array, do the following:
#			rotate that layer to 45°
#	when the layer is moused out, do the following:
#		for every layer in the layer array, do the following:
#			rotate that layer to 0°

