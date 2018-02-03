
		######################################## P4
		# When a method runs, it can refer to the object it is attached to. 
		# In JavaScript and CoffeeScript, we use the keyword 'this'.

		cat1 = {}
		cat1.name  = "meowz"
		cat1.speak = ->
			print(this.name)	# when this code runs, 'this' refers to the 'cat1' object

		cat2 = {}
		cat2.name = "mittens"
		cat2.speak = ->
			print(this.name)	# when this code runs, 'this' refers to the 'cat2' object


		cat1.speak()	
		cat2.speak()

######################################## P4b
# We can use existing functions as methods
# In other words, we can attach existing functions to objects.

genericSpeak = -> print(this.name)  

cat1 = {name:"meowz",speak:genericSpeak} 	# NOTE that we are NOT calling the genericSpeak function here.
cat2 = {name:"mittens",speak:genericSpeak}	# We are only refering to it. 
cat3 = {name:"violet",speak:genericSpeak}	# The property 'speak' will contain the function 'genericSpeak'.

cat1.speak() # 'cat1.speak' refers to the genericSpeak function code
cat2.speak() # 'cat2.speak' also refers to the genericSpeak function code
cat3.speak() # same.


######################################## P5
# Using the 'this' keyword, a method can modify the variables of the object it belongs to.

cat = {hairballs:10}
cat.hork = ->  
	this.hairballs = this.hairballs - 1
	print(this.hairballs + " remaining")


cat.hork()	# notice how the method call has the same GENERAL effect
cat.hork()	# but the SPECIFIC results are different
cat.hork()
cat.hork()