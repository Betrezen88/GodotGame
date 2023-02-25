extends Node2D

export var value : float
export var interval : float

onready var timer = $Timer

signal restore(value)

func _ready():
	timer.connect("timeout", self, "on_timeout")
	timer.start()

func on_timeout() -> void:
	emit_signal("restore", value)
