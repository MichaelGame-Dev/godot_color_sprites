extends Sprite2D


@onready var color_sprite: Sprite2D = $'.'
@onready var color_texture: TextureRect = $ColorTexture
@onready var texture_rect: TextureRect = $TextureRect
@onready var timer: Timer = $Timer


func _ready() -> void:
	timer.start()
	# Using .modulate will change the color of all child nodes too
	#color_sprite.self_modulate = Color("red")
	# This opeing is similar to the first, but from_string let's you add a default too. I guess this is if you asked for player input maybe
#	color_sprite.self_modulate = Color.from_string('black', 'blue')
#	color_sprite.self_modulate = Color(1,0,0,1)
	# You can also update the individual RGB values
#	color_sprite.self_modulate.r = 0
#	color_sprite.self_modulate.g = 1
#	color_sprite.self_modulate.b = 0
	# and the alpha value
#	color_sprite.self_modulate.a = 1
	# Either of these will work. Both do the same thing
	color_sprite.set_self_modulate(Color.hex(0x049CD8ff))
	#color_sprite.get_self_modulate())
	# It appears you don't even need to necessarily use `.hex` hex value is 0xRRBBGGAA
	color_sprite.self_modulate = Color(0x049CD8ff)
#
	# Lighten or darken the current color
#	color_sprite.self_modulate.lightened(1)
#	color_sprite.self_modulate.darkened(1)
	
	# Notice the difference here:
#	color_texture.modulate = Color('blue')
#	texture_rect.modulate = Color('blue')


	# Can use HSL as well
#	texture_rect.modulate = Color.from_ok_hsl(0.9, 0.3, 0.5, 1.0)
	# Or HSV
#	texture_rect.modulate = Color.from_hsv(0.9, 0.3, 0.98, 1.0)
	
	# Oddly, you can also set HSV individually, but not l
	color_texture.self_modulate.h = 1
	color_texture.self_modulate.s = 1
	color_texture.self_modulate.v = 1

#	color_texture.modulate = Color(1,0,0,1)
	# Won't work here, but sometimes if modulating a parent work work, you may need to add .texture
#color_texture.texture.modulate = Color(1,0,0,1)


func _process(delta: float) -> void:
	pass
	#print(timer.time_left)

func star() -> void:
	# essentially pair this with color_sprite.set_self_modulate(Color.hex(0x049CD8ff))
	# a shader may be a better option than this?
	if color_sprite.self_modulate == Color.hex(0x049CD8ff):
		print("color1")
		color_sprite.self_modulate = Color.hex(0xFBD000ff)
		return
	if color_sprite.self_modulate == Color.hex(0xFBD000ff):
		print("color2")
		color_sprite.self_modulate = Color.hex(0xE52521ff)
		return
	if color_sprite.self_modulate == Color.hex(0xE52521ff):
		print("color3")
		color_sprite.self_modulate = Color.hex(0x049CD8ff)
		return

func _on_timer_timeout() -> void:
	# can adjust timing to change the speed the changes happen
	star() 
