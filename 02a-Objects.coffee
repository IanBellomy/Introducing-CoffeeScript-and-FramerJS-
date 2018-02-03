###
		
	The programs in this document cover: 
		
		• Objects / Complex Data
		• Object Literals and Function Calls
		• References

###

######################################## 
######################################## Objects
######################################## 

######################################## P1
# In addition to primitive datatypes there are complex datatypes or 'data structures'.
# The most common and generic complex type is an 'Object'.
# You can think of it as a collection of variables.

pet = {}			# The curly brackets are literally an Object or an 'Object Literal'.
pet.name = "Sam" 	# Create a variable, name, 'on the object'.
pet.type = "Cat" 	# A variable on an object is called a 'property'.
					# The Object.property notation is called 'Dot Notation' or 'Dot Syntax'.
					# It is common in many languages. 

# Properties work EXACTLY like variables. They are just variables grouped with an object. 
print(pet.name) 	# "Sam"
print(pet.type)		# "Cat"
pet.type = "Old cat"	# Overwrite the data in the type property
print(pet.type)		# "Old cat"


######################################## P2
# Objects allow us to create structured data.

pet1 = {}
pet1.type = "Cat"
pet1.name = "Sam"

pet2 = {}
pet2.type = "Dog"
pet2.name = "Ralph"

print(pet1.type)	# "Cat"
print(pet1.name)	# "Sam"
print(pet2.type)	# "Dog"
print(pet2.name)	# "Ralph"


######################################## P2a
# Layers are themselves complex objects. 

box = new Layer() 	# We'll discuss the 'new' keyword later.
box.x = 100
box.y = 50

print(box.x)	# 100
print(box.y)	# 50

# We'll come back to them later.


######################################## P3
# You can define an object's properties in the Object Literal.
# However, instead of using '=' we use ':'.
# This is called 'Object Literal Notation' opposed to 'Dot Notation' or 'Dot Syntax'.

pet = {name:"Sam",type:"Cat"}  	# Each 'property:value' is called a 'property value pair'.
								# There are two 'property value pairs' in this object literal.
print(pet) 	# {name:"Sam",type:"Cat"}

# You might expect to use '=' instead of ':' for object literals. 
# The reasons for the using ':' are partly historical and partly because of 
# small distinctions between -assigning- data and -creating- data. 


######################################## P4
# You can create nested object structures or hierarchies. 

pet = {name:"Sam Jr."}
pet.parent = {name:"Sam Sr."}
pet.parent.parent = {name:"Ol papa Sam"}

print(pet.parent.name)			# "Sam Sr."
print(pet.parent.parent.name)	# "Ol papa Sam."


######################################## P5
# You can also create objects with nested structures on one line using 'Object Literal Notation'

pet = {name:"Sam",type:"Cat",age:3,parent:{name: "Sam Sr."}}

print(pet.name)			# "Sam"
print(pet.type)			# "Cat"
print(pet.age)			# 3
print(pet.parent.name)	# "Sam Sr."

# Above, pet refers to an object with a property parent that refers 
# to ANOTHER object with a property name.

######################################## P6
# Here's an example of a deeply nested complex data structure.

arm = {lowerArm:{hand:{fingers:5}}}

print(arm.lowerArm.hand.fingers) # 5


######################################## 
######################################## Object Literals and Function Calls
######################################## 

######################################## P7
# Some functions accept objects as arguments

pet = {name:"Mike Hat",type:"Dog"}
print(pet) # {name:"Mike Hat",type:"Dog"}


######################################## P8
# We can also use an Object Literal directly as an argument

print({name:"Mike Hat",type:"Dog"}) # {name:"Mike Hat",type:"Dog"}




######################################## 
######################################## Built in variables
######################################## 

######################################## P9
# Framer and JavaScript come with many built in variables.
# They are often organized into objects.
# In most cases, you can not put data in them, you can only read their values.
# Here are two useful ones. 

print(Screen.width)		# depends on your output window width
print(Screen.height)	# depends on your output window height


######################################## 
######################################## [Optional] Object literal shorthand
######################################## 

######################################## P10
# Nested object structures are not uncommon in CoffeeScript. 
# Putting them on one line is messy though.
# So CoffeeScript has a shorthand.
# It looks like this:

course = 	
	students:18
	room:5221
	instructor:
		name:"Bob"
		age:81

print(course) # {students:18, room:5221, instructor:{name:"Bob", age:81}}

print(course.students)			# 18
print(course.room)				# 5221
print(course.instructor)		# {name:"Bob", age:81}
print(course.instructor.name)	# "Bob"

# Instead of curly brackets we start the object on a new line and indent. 
# property:value pairs at the same level of indentation are part of the same object.
# Indenting further creates a new nested object.
# This is another example of 'significant whitespace'


######################################## P11
# Here's another example:

# This statement...
pet = {name:"Sam",type:"Cat",age:3}

# is the same as this statement...
pet = 				# variable declaration and assignment, the line return indicates 'start new object'
	name:"Sam"  	# a property value pair, and the beginning of the object
	type:"Cat"		# another property value pair. It belongs to the same object
	age:3 			# another
	parent:			# another property, but the value is...
			name: "Sam Sr."		# A NEW object

print(pet.name)			# "Sam"
print(pet.type)			# "Cat"
print(pet.age)			# 3
print(pet.parent.name)	# "Sam Sr."



######################################## P12
# We can also use an Object Literal Shorthand when calling functions.

print(	
	name:"Mike Hat"		# The line return AND the tab together indicate 'new object literal'
	type:"Dog")			
						# {name:"Mike Hat", type:"Dog"}

# This program is EXACTLY the same as P8.

######################################## P13
# We can combine object literal shorthand with function shorthand.
# This is very common.

print					# The line return and tab indicate a new object literal.
	name:"Mike Hat"		# Because there is an argument, the print function needs no parenthesis.
	type:"Dog"
						# {name:"Mike Hat", type:"Dog"}

# This program is EXACTLY the same as P8 and P12.
# We call the function print and pass it an object with two properties. 

######################################## 
######################################## [Optional] References (Tricky!)
######################################## 

######################################## P14
# Assigning Objects to variables is DIFFERENT from assigning primitive data to variables.
# Object data is always given it's OWN UNIQUE memory area. 
# When an Object is assigned to a variable, the variable 'refers to' this memory.
# The variable has a 'reference'. A reference is NOT the data. It only 'refers to' the data.
# This means multiple variables can 'refer to' the SAME Object Data. 


clark = {power:"flight"}	# Create an object literal with property 'power' that holds data "flight" and assign a REFERENCE to this object to the variable 'clark'.
superman = clark 			# Copy the clark's REFERENCE to the above object into the new variable 'superman'
superman.weakness = "kryptonite" # Create new property 'weakness' on the object data above.

print(superman.power)		# "flight"
print(clark.power)			# "flight"
print(superman.weakness)	# "kryptonite"
print(clark.weakness)		# "kryptonite"
							# Clark and Superman 'refer to' the SAME object!


######################################## P14a
# Here's an example using Layers.

box = new Layer()		# make a Layer
theOnlyBox = box 		# theOnlyBox now refers to our original layer. 
myFavoriteBox = box     # myFavoriteBox now refers to our original layer. 
						# There is still only one layer, just three variables refering to it.
						
myFavoriteBox.backgroundColor = "red" # We modify layer data.
box = "nothing"			# the Layer data still exists. box just doesn't refer to it anymore.


######################################## P15
# Note the difference when using primitive data.

clark = "kryptonian"	# Assign data to variable 'clark'
superman = clark 		# COPY data 'kryptonian' to variable 'superman'
clark = "Kent"			# Assign new data to variable 'clark'. 
						# superman variable unaffected.

print(clark)			# "Kent"
print(superman)			# "kryptonian"


######################################## P16
# If we assign primitive data to a variable that has a REFERENCE, the REFERENCE is overwritten, 
# but the original object data will persist in memory

clark = {power:"flight"}
superman = clark
clark = "Kent" 	# This overwrites the -reference- NOT the -object data-. 
				# The object still exists.
				# The variable superman still refers to it.

print(clark)	# "Kent"
print(superman) # {power:"flight"}


######################################## P16b
# An example of the above using Layers

box = new Layer()
box = "nothing"		# No variables refer to the layer data, but it still exists!	
					# The layer data is still in memory and in our document even though we can't refer to it!


######################################## 
######################################## End
######################################## 
