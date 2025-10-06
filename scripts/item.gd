extends Area2D

var pulse_timer := 0.0

@onready var sprite: Sprite2D = $Sprite2D

func _ready():
	# If the sprite doesn't have a texture yet, create a simple gradient texture
	if not sprite.texture:
		var grad = Gradient.new()
		grad.add_point(0.0, Color("#5de8ff"))
		grad.add_point(1.0, Color("#2b98b5"))

		var tex = GradientTexture2D.new()
		tex.gradient = grad
		tex.width = 20
		tex.height = 20

		sprite.texture = tex
		sprite.z_index = 1

func _process(delta):
	# Pulsing effect
	pulse_timer += delta * 3
	sprite.scale = Vector2.ONE * (1.0 + 0.15 * sin(pulse_timer))
