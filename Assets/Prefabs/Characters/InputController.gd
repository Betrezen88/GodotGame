extends Node2D

signal attack_1_primary_pressed()
signal attack_1_primary_released()
signal attack_1_secondary_pressed()
signal attack_1_secondary_released()
signal attack_2_primary_pressed()
signal attack_2_primary_released()
signal attack_2_secondary_pressed()
signal attack_2_secondary_released()
signal dash_pressed()

# Method returns information on player direction input based on input.
func get_directional_input() -> Vector2:
	return Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"),
					Input.get_action_strength("down") - Input.get_action_strength("up"))

func _input(event):
	if event.is_action_pressed("skill_attack_primary"):
		if Input.is_key_pressed(KEY_CONTROL):
			emit_signal("attack_2_primary_pressed")
		else:
			emit_signal("attack_1_primary_pressed")

	if event.is_action_pressed("skill_attack_secondary"):
		if Input.is_key_pressed(KEY_CONTROL):
			emit_signal("attack_2_secondary_pressed")
		else:
			emit_signal("attack_1_secondary_pressed")

	if event.is_action_released("skill_attack_primary"):
		if Input.is_key_pressed(KEY_CONTROL):
			emit_signal("attack_2_primary_released")
		else:
			emit_signal("attack_1_primary_released")

	if event.is_action_released("skill_attack_secondary"):
		if Input.is_key_pressed(KEY_CONTROL):
			emit_signal("attack_2_secondary_released")
		else:
			emit_signal("attack_1_secondary_released")

	if event.is_action_pressed("dash"):
		emit_signal("dash_pressed")
