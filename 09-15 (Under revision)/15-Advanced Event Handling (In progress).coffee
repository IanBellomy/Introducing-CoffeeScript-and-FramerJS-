###

	(In progress)

	• Advanced event handling

###

######################## P1
# It's not uncommon for a function to use a String for an important detail.
# However, this can create a problem.
# If the String has a typo, for example, "mousedown", your event will never be called and there will be no error. 
# The program will run, but will not work as expected, and you'll have no indication as to why.
# To get around this, it is common practice to create variables that hold onto these words. 
# If you mistype the variable, an error will occur at that specific place in the code, and you will be notified. 
# This is preferable to the program failing silently. 
# Personally, I tend to flip back and forth because: 
# 1. The auto complete features for CoffeeScript Editors aren't that good really... 
# 2. The more you type, the more chance of a mistake in the first place.
# 3. Really, this idea works best with enums, a structure that JavaScript/CoffeeScript doesn't support. 


# Properties that store strings: 
print Events.MouseOver
print Events.MouseOut
print Events.MouseDown
print Events.MouseUp
print Events.DoubleClick

layerA = new Layer

layerA.on "mousedown", ->		# Typo, but no error. 
	@x = 50

layerA.on Events.MousUp, ->		# Typo, with a potentially time saving error message. 
	@y = 50



