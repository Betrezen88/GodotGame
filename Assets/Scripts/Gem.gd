extends Node2D

export var gem_name : String
export var primary_scene : PackedScene
export var secondary_scene : PackedScene
export var spawn_point_path : NodePath

onready var spawn_point := get_node(spawn_point_path)
onready var primary_cooldown := $PrimaryCooldown
onready var secondary_cooldown := $SecondaryCooldown

func attack_primary():
	if primary_cooldown.is_ready_to_use():
		instance(primary_scene)
		primary_cooldown.activate()

func attack_secondary():
	if secondary_cooldown.is_ready_to_use():
		instance(secondary_scene)
		secondary_cooldown.activate()

func instance(scene : PackedScene):
	var instance = scene.instance()
	instance.position = spawn_point.global_position
	instance.direction = global_position.direction_to(get_global_mouse_position())
	add_child(instance)

func is_primary_chargeable() -> bool:
	if primary_scene.has_method("is_chargeable"):
		return primary_scene.is_chargeable()
	return false

func is_secondary_chargable() -> bool:
	if secondary_scene.has_method("is_chargeable"):
		return secondary_scene.is_chargeable()
	return false
