###

	The following quizzes are optional.	

	— Ian Bellomy, 2016

###
######################## Q1

rat = {}
trainChef rat
rat.cook()			# "Soup's up!"


######################## Q2

describe					# "Bob is 42 with Brown hair"
	name: "Bob"
	age: "42"
	hair: "Brown"


######################## Q3

print newAnt().legs	# 6


######################## Q4

bob = newBug 6
bill = newBug 8
print bob.legs 		#6
print bill.legs 	#8 


######################## Q5

sam = newCat()
sal = newCat()

sam.feed()
print sam.hungry   # false
print sal.hungry   # true


######################## Q6

horn()			# "HONK!"
honk horn		# "HONK!"


######################## Q7

newGreeting()()		# "Hi"


######################## Q8

americanHello 	= newGreeting("Hi")
spanishHello 	= newGreeting("Saludo")

americanHello() 				# "Hi"
spanishHello() 					# "Saludo"



######################## Q9

brokenCountDown 4	# 4
					# 3
					# 2
					# 1
					# 0
					# -1
					# -2
					# ... program will eventually freeze and stop.



