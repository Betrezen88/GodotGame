extends Node2D

export var valueComponentPath : NodePath

export var value : float
export var interval : float

onready var timer = $Timer
onready var valueComponent = get_node(valueComponentPath)

signal restore(value)

func _ready():
	valueComponent.connect("value_changed", self, "on_value_changed")
	timer.connect("timeout", self, "on_timeout")
	if !valueComponent.is_full():
		timer.start()

func on_timeout() -> void:
	emit_signal("restore", value)

func on_value_changed(_value) -> void:
	print("on_value_changed: ", _value)
	if valueComponent.is_full():
		timer.stop()
	else:
		timer.start()
