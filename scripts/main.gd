extends Node2D

@onready var player = $Player
@onready var machine = $Machine
@onready var terminal = $Terminal
@onready var item_spawn = $ItemSpawnPoint
@onready var ui_label = $UI/Label

var item_scene = preload("res://scenes/item.tscn")
var current_item: Area2D = null

func _ready():
	ui_label.text = "Move with WASD. Press E to interact."

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		# Spawn item at machine
		if player.global_position.distance_to(machine.global_position) < 40 and current_item == null:
			current_item = item_scene.instantiate()
			add_child(current_item)
			current_item.global_position = item_spawn.global_position
			ui_label.text = "Item spawned! Pick it up."

		# Pick up item
		elif current_item and player.global_position.distance_to(current_item.global_position) < 30 and player.carrying_item == null:
			player.carrying_item = current_item
			current_item.get_parent().remove_child(current_item)
			player.add_child(current_item)
			current_item.position = Vector2.ZERO
			ui_label.text = "Carrying item."

		# Deposit item at terminal
		elif player.carrying_item and player.global_position.distance_to(terminal.global_position) < 40:
			player.remove_child(player.carrying_item)
			player.carrying_item.queue_free()
			player.carrying_item = null
			current_item = null
			ui_label.text = "Item deposited!"
