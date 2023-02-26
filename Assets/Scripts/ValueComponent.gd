extends Node2D

export var max_value : float
export var current : float

signal value_is_zero()
signal value_changed(value)

func _ready():
	connect("value_changed", self, "on_value_changed")

func increase(value) -> void:
	current = clamp(current+value, 0, max_value)
	emit_signal("value_changed", current)

func deacrease(value) -> void:
	current = clamp(current-value, 0, max_value)
	emit_signal("value_changed", current)

func is_full() -> bool:
	return current == max_value

func on_value_changed(value) -> void:
	if value <= 0:
		emit_signal("value_is_zero")
