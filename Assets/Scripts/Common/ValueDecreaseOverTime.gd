extends Node2D

export var valuePath : NodePath

export var decreaseBy : float
export var interval : float

onready var timer = $Timer
onready var value = get_node(valuePath)

func _ready():
	value.connect("value_is_min", self, "on_value_is_min")
	value.connect("value_changed", self, "on_value_changed")
	timer.connect("timeout", self, "on_timeout")
	if !value.is_min():
		timer.start(interval)
	
func on_timeout():
	value.decrease(decreaseBy)

func on_value_is_min():
	timer.stop()

func on_value_changed(_value):
	if timer.is_stroped() && !value.is_min():
		timer.start(interval)
