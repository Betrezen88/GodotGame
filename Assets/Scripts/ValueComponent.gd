extends Node2D

export var max_value : float
export var current : float

signal value_is_zero()

func increase(value) -> void:
	current = clamp(current+value, 0, max_value)

func deacrease(value) -> void:
	current = clamp(current-value, 0, max_value)
	if current <= 0:
		emit_signal("value_is_zero")
