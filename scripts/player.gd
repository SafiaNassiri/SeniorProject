extends CharacterBody2D

@export var speed := 300
@export var visual_size := 40
var carrying_item: Node = null

func _ready():
	# temporary visible square
	var color_rect = ColorRect.new()
	color_rect.color = Color(0.7, 0.8, 0.9)
	color_rect.size = Vector2(30, 30)
	color_rect.position = Vector2(-15, -15) # center on parent
	add_child(color_rect)


#func _ready():
	#position = Vector2(400, 300)  # center of screen
#
	#var sprite = $Sprite2D
	#if not sprite.texture:
		#var tex = ImageTexture.new()
		#var img = Image.new()
		#img.create(30, 30, false, Image.FORMAT_RGBA8)
		#img.fill(Color(0.7, 0.8, 0.9))
		#tex.create_from_image(img)
		#sprite.texture = tex
		#sprite.centered = true
		#sprite.z_index = 1

func _physics_process(delta):
	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	if input_vector.length() > 0:
		input_vector = input_vector.normalized()

	velocity = input_vector * speed
	move_and_slide()
