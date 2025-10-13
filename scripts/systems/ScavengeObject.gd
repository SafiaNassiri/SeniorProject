extends Area2D

@export var scrap_value: int = 10
var can_interact := false
var player_ref: Node = null

func _ready():
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)

func _on_body_entered(body):
	if body.is_in_group("player"):
		can_interact = true
		player_ref = body

func _on_body_exited(body):
	if body.is_in_group("player"):
		can_interact = false
		player_ref = null

func _process(_delta):
	if can_interact and Input.is_action_just_pressed("interact"):
		player_ref.stats.add_scrap(scrap_value)
		queue_free() # removes the scavenged object
