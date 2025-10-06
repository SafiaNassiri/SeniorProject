extends Node2D

@export var color := Color(0.4, 0.4, 0.4)
@export var width := 20
@export var height := 70

func _ready():
	# Simple visual for debugging / placeholder
	if not has_node("ColorRect"):
		var dbg = ColorRect.new()
		dbg.color = color
		dbg.size = Vector2(width, height)
		dbg.position = Vector2(-width/2, -height/2) # center on parent
		add_child(dbg)
