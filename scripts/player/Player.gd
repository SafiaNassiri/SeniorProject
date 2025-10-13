extends CharacterBody2D

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var stats = preload("res://scripts/player/PlayerStats.gd").new()

var gender: String = "male" # default gender
var direction: String = "down"
var state: String = "idle"

var speed := 150.0
var sprint_multiplier := 1.8
var is_sprinting := false

func _ready():
	_load_player_prefs()
	_setup_animations()

func _load_player_prefs():
	if FileAccess.file_exists("user://prefs.json"):
		var file = FileAccess.open("user://prefs.json", FileAccess.READ)
		var parse_result = JSON.parse_string(file.get_as_text())
		file.close()
		if parse_result.error == OK and parse_result.result.has("gender"):
			gender = parse_result.result["gender"]

func _setup_animations():
	# Load SpriteFrames resource for the selected gender
	var frames_path = "res://assets/sprites/player/%s/player_frames.tres" % gender
	if ResourceLoader.exists(frames_path, "SpriteFrames"):
		var frames_res: SpriteFrames = load(frames_path)
		anim_sprite.sprite_frames = frames_res
	else:
		push_warning("⚠️ Missing SpriteFrames resource for '%s'" % gender)

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	is_sprinting = Input.is_action_pressed("dash") and stats.stamina > 0
	var current_speed = speed * (sprint_multiplier if is_sprinting else 1)
	velocity = input_vector * current_speed
	move_and_slide()

	if is_sprinting:
		stats.use_stamina(delta * 10)
	else:
		stats.recover_stamina(delta * 5)

	_update_animation(input_vector)

func _update_animation(input_vector: Vector2):
	if input_vector == Vector2.ZERO:
		state = "idle"
	else:
		state = "walk"
		if input_vector.x > 0 and input_vector.y > 0:
			direction = "rightdown"
		elif input_vector.x < 0 and input_vector.y > 0:
			direction = "leftdown"
		elif input_vector.x > 0 and input_vector.y < 0:
			direction = "rightup"
		elif input_vector.x < 0 and input_vector.y < 0:
			direction = "leftup"
		elif input_vector.x > 0:
			direction = "rightdown"  # use a fallback, e.g., rightdown
		elif input_vector.x < 0:
			direction = "leftdown"   # fallback for left
		elif input_vector.y > 0:
			direction = "down"
		elif input_vector.y < 0:
			direction = "up"

	var anim_name = "%s_%s" % [state, direction]
	var frames_res: SpriteFrames = anim_sprite.sprite_frames
	if frames_res != null and frames_res.has_animation(anim_name):
		if anim_sprite.animation != anim_name:
			anim_sprite.play(anim_name)
