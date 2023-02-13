class_name SkillInstanceHandler
extends Node2D

export var skill_spawn_point : NodePath
export var skill : PackedScene
export var primary_input_sequence : String
export var secondary_input_sequence : String

onready var spawn_point = get_node(skill_spawn_point)
onready var cooldown = $Cooldown

func _input(event):
	if event.is_action_pressed(primary_input_sequence) and cooldown.is_ready_to_use():
		primary_attack()
		cooldown.activate()
	if event.is_action_pressed(secondary_input_sequence) and cooldown.is_ready_to_use():
		secondary_attack()
		cooldown.activate()

func primary_attack() -> void:
	var instance = skill.instance()
	instance.position = spawn_point.global_position
	instance.direction = global_position.direction_to(get_global_mouse_position())
	add_child(instance)

func secondary_attack() -> void:
	var instance = skill.instance()
	instance.position = spawn_point.global_position
	instance.direction = global_position.direction_to(get_global_mouse_position())
	add_child(instance)
