class_name HurtBox
extends Area2D

signal damage_received(value)

func _init() ->void:
	collision_layer = 0
	collision_mask = 2

func _ready() ->void:
	connect("area_entered", self, "_on_area_entered")

func _on_area_entered(hitbox: HitBox) -> void:
	if hitbox == null:
		return
	
	emit_signal("damage_received", 10)
