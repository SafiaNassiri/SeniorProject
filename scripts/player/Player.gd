extends CharacterBody2D

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var stats = preload("res://scripts/player/PlayerStats.gd").new()

var gender: String = "male"
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
		var prefs = JSON.parse_string(file.get_as_text())
		if prefs and prefs.has("gender"):
			gender = prefs["gender"]

func _setup_animations():
	# load the correct sprite frames resource for the selected gender
	var frames_path = "res://assets/sprites/player/%s/player_frames.tres" % gender
	if ResourceLoader.exists(frames_path):
		anim_sprite.frames = load(frames_path)
	else:
		print("⚠️ Missing SpriteFrames resource for", gender)

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	is_sprinting = Input.is_action_pressed("sprint") and stats.stamina > 0
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
		# Determine facing direction
		if abs(input_vector.x) > abs(input_vector.y):
			direction = "right" if input_vector.x > 0 else "left"
		else:
			direction = "down" if input_vector.y > 0 else "up"

	var anim_name = "%s_%s" % [state, direction]
	if anim_sprite.has_animation(anim_name):
		anim_sprite.play(anim_name)
