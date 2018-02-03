###

Framer layers have built in scrolling property that allows us to create scrolling content that behaves like system scrolling does. No need to capture two finger swipe events.

We can also listen from scroll events and modify other things based on these. This is how we create parallax scrolling.  

###


# Make a long layer with a repeating background
# You could also do this with just a long background.
bg = new Layer
	width: 737
	height: 2000	
	image: "images/repeatingLegoImage.jpg"	
	style:
		backgroundSize:"737px 507px"
		backgroundRepeat:"repeat"

# Lego image courtosy of flickr user 'mahjqa'
# profile: https://www.flickr.com/photos/28134808@N02/
# image: https://www.flickr.com/photos/28134808@N02/5450854606

# Make a scrolling layer
textLayer = new Layer
	x:100	
	width: 300
	height: Screen.height
	backgroundColor: "rgba(0,0,0,0.7)"	
	scroll:true  
	style:
		padding:"12px"		
		fontSize:"14px"
	html:"<br><br><br>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla condimentum, mauris a consectetur tempus, sapien dolor porta erat, eu tempus sem purus vitae tellus. Sed dignissim mauris a augue hendrerit, non scelerisque eros congue. Curabitur tempor lobortis eros mollis tempus. Nam mollis aliquam lobortis. In malesuada fringilla semper. Pellentesque at magna eu magna tincidunt sollicitudin ac ut lorem. Curabitur nibh lacus, finibus ut dolor at, tincidunt sodales sem.<br><br>Sed aliquet eros at mauris condimentum tristique. Morbi quis fringilla urna. Maecenas rhoncus lacus vel luctus pretium. Nam bibendum luctus aliquam. Pellentesque ac fermentum augue. Praesent dignissim metus eu tempus facilisis. Proin sed erat eget mi tristique ultrices. Aenean in metus aliquet, porttitor nibh et, pulvinar metus. Fusce elementum, dui commodo mattis venenatis, velit dolor imperdiet dui, non maximus mauris nunc ac ligula. Donec est mauris, pulvinar non sollicitudin a, lobortis at dolor. Praesent pulvinar elit consequat diam fringilla, id vehicula diam tempus. Suspendisse purus velit, ultricies et auctor at, commodo ac mi.<br><br>Nunc pharetra mauris sem, eget tincidunt nulla rhoncus sit amet. Vivamus gravida scelerisque arcu, ullamcorper posuere dolor aliquam ut. Fusce arcu leo, lobortis et dolor eu, auctor bibendum dui. Quisque nisl ligula, placerat nec tempor ut, condimentum eget metus. Aliquam erat volutpat. Sed congue vestibulum dolor quis pulvinar. Pellentesque eu pellentesque nisl, at mattis odio. Nullam vitae molestie ligula. Duis vel nulla aliquet, vehicula magna id, faucibus nunc.<br><br>Pellentesque nisi eros, mattis ac efficitur ac, vestibulum non mauris. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dolor diam, bibendum vel lacus id, vulputate euismod augue. Morbi laoreet vitae ligula sed pulvinar. Maecenas vitae maximus magna, vel malesuada lacus. Aenean vel neque pellentesque, feugiat ligula eu, bibendum libero. Sed ultricies elit et quam tincidunt sagittis. Phasellus tempus eget nibh in fringilla. Pellentesque volutpat mattis vehicula. Fusce ut elit gravida, sagittis diam a, elementum ligula. Aenean mollis eros vitae vulputate congue. Vivamus feugiat nibh sit amet quam varius mollis.<br><br>Vestibulum ac eros lorem. Nullam luctus at odio feugiat tincidunt. Maecenas pharetra tincidunt lectus, in aliquam ex placerat eu. Duis eu lacinia orci, sed tempus mi. Suspendisse egestas justo eu lorem ultrices, nec consequat sapien laoreet. Morbi eleifend feugiat purus ut finibus. Pellentesque aliquam nec magna non porta. Nam ornare, nisi eget lobortis dictum, metus felis volutpat magna, et gravida purus ex id metus. Etiam dignissim lectus id libero sagittis porttitor.<br><br><br>"

textLayer.onScroll (e)->
	# Note, with parallax, everything always moves in the same -direction- just not at the same speed.
	bg.y = -textLayer.scrollY / 3
	
	# Note that if you overscroll, the window's white background is exposed. To avoid this, place the background above the top edge initially. For example so that y:-50 . Then, in the onScroll event, offset it by the same amount, e.g.
	# bg.y = -textLayer.scrollY / 3 - 50