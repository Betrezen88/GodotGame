extends Node2D

export var max_value : float
export var min_value : float = 0
export var current : float

signal value_is_min()
signal value_is_max()
signal value_changed(value)

func _ready():
	connect("value_changed", self, "on_value_changed")

func increase(value: float) -> void:
	current = clamp(current+value, min_value, max_value)
	emit_signal("value_changed", current)

func decrease(value: float) -> void:
	current = clamp(current-value, min_value, max_value)
	emit_signal("value_changed", current)

func is_max() -> bool:
	return current == max_value
	
func is_min() -> bool:
	return current == min_value

func on_value_changed(value) -> void:
	if value == min_value:
		emit_signal("value_is_min")
	if value == max_value:
		emit_signal("value_is_max")
