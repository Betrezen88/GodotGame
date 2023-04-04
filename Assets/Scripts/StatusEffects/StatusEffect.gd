extends Node

export var min_value : int
export var max_value : int
export var time : float

onready var timer = $Timer
onready var current : int = min_value

signal max_reached()
signal current_changed(value)

# Called when the node enters the scene tree for the first time.
func _ready():
	#print("StatusEffect._ready()")
	timer.connect("timeout", self, "on_timeout")
	self.connect("current_changed", self, "on_current_changed")

func increase_current_value(value : int):
	print("StatusEffect.increase_current_value() ", value)
	current += value
	current = clamp(current, min_value, max_value)
	emit_signal("current_changed", current)

func on_timeout():
	#print("StatusEffect.on_timeout()")
	if current > 0:
		current -= 1
		emit_signal("current_changed", current)

func on_current_changed(value: int):
	#print("StatusEffect.on_current_changed() ", value)
	if value == max_value:
		emit_signal("max_reached")
	
	if timer.is_stopped() && (value > 0 && value < 100):
		print("StatusEffect.resumed()")
		resume()
	
	if !timer.is_stopped() && value == 0:
		print("StatusEffect.pause()")
		pause()

func pause():
	timer.stop()
	
func resume():
	timer.start(time)
