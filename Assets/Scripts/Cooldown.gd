extends Node2D

export(float) var activeTime := 0.5
export(float) var cooldownTime := 0.5

onready var activeTimer = $ActiveTimer
onready var cooldownTimer = $CooldownTimer

var ready = true
var active = false

signal activated()
signal deactivate()

func _ready():
	activeTimer.connect("timeout", self, "on_active_end")
	cooldownTimer.connect("timeout", self, "on_cooldown_end")

func activate():
	active = true
	ready = false
	emit_signal("activated")
	activeTimer.start(activeTime)

func on_active_end():
	active = false
	activeTimer.stop()
	emit_signal("deactivate")
	cooldownTimer.start(cooldownTime)

func on_cooldown_end():
	ready = true
	cooldownTimer.stop()

func is_ready_to_use():
	return not active and ready
