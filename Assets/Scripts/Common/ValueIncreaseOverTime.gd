extends Node2D

export var valuePath : NodePath

export var increaseBy : float
export var interval : float

onready var timer = $Timer
onready var value = get_node(valuePath)

func _ready():
	value.connect("value_is_max", self, "on_value_is_max")
	value.connect("value_changed", self, "on_value_changed")
	timer.connect("timeout", self, "on_timeout")
	if !value.is_max():
		timer.start(interval)

func on_timeout():
	value.increase(increaseBy)
	
func on_value_is_max():
	timer.stop()

func on_value_changed(_value):
	if timer.is_stopped() && !value.is_max():
		timer.start(interval)
