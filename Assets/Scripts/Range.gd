extends Node2D

export(float) var max_range
export(NodePath) var parent_path

onready var parent = get_node(parent_path) as Node2D
onready var start = parent.position

signal max_range_reached()

func _physics_process(_delta) -> void:
	if abs(parent.position.distance_to(start)) >= max_range:
		emit_signal("max_range_reached")
