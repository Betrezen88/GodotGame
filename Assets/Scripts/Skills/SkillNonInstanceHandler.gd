class_name SkillNonInstanceHandler
extends Node2D

export(PackedScene) var skill
export(String) var input_sequence

onready var cooldown = $Cooldown

func _input(event):
	if event.is_action_pressed(input_sequence) and cooldown.is_ready_to_use():
		print("SkillNonInstanceHandler")
		cooldown.activate()
