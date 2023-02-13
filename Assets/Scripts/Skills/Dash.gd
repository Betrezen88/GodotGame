extends Node2D

export var speed : float

onready var cooldown := $Cooldown

signal dash_speed(speed)

func _ready() -> void:
	cooldown.connect("activated", self, "on_activated")
	cooldown.connect("deactivate", self, "on_deactivate")

func use() -> void:
	if cooldown.is_ready_to_use():
		cooldown.activate()

func on_activated() -> void:
	emit_signal("dash_speed", speed)

func on_deactivate() -> void:
	emit_signal("dash_speed", 0)
