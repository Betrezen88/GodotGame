class_name HurtBox
extends Area2D

func _init() ->void:
	collision_layer = 0
	collision_mask = 2

func _ready() ->void:
	print("HurtBox owner: ", owner)
	connect("area_entered", self, "_on_area_entered")

func _on_area_entered(hitbox: HitBox) -> void:
	print("_on_area_entered")
	if hitbox == null:
		return
	
	print(owner)
	
	if owner.has_method("take_damage"):
		owner.take_damage()
	else:
		print ("owner does not have take_damage method")
