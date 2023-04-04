class_name HitBox
extends Area2D

export var damage := 0

onready var collision_shape := $CollisionShape2D

func _init() -> void:
	collision_layer = 2
	collision_mask = 0

func set_disabled(is_disabled: bool) -> void:
	collision_shape.set_deferred("disabled", is_disabled)
