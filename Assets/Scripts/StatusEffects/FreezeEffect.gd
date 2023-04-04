extends Node

export var frozen_time : float

onready var frozen_timer = $FrozenTimer
onready var status_effect = $StatusEffect

var frozen : bool = false

func _ready():
	#print("FreezeEffect._ready()")
	frozen_timer.connect("timeout", self, "on_frozen_end")
	status_effect.connect("current_changed", self, "on_current_changed")
	status_effect.connect("max_reached", self, "on_max_reached")

func add_value(value: int):
	if frozen:
		return
	#print("FreezeEffect.add_value()", value)
	status_effect.increase_current_value(value)

func on_max_reached():
	print("Frozen")
	frozen = true
	status_effect.pause()
	frozen_timer.start(frozen_time)

func on_frozen_end():
	print("FreezeEffect.on_frozen_end()")
	frozen = false
	frozen_timer.stop()
	status_effect.resume()

func on_current_changed(value: int):
	#print("FreezeEffect.on_current_changed() ", value)
	print("Character should be slowed by ", value, "%")
	pass
