class_name Skill
extends Node2D

# Variables
onready var activeTimer = $ActiveTimer
onready var cooldownTimer = $CooldownTimer
onready var stats = $Stats

var ready = true
var active = false

# Signals
signal deactivate

# Methods
# Called when the node enters the scene tree for the first time.
func _ready():
	activeTimer.connect("timeout", self, "on_active_end")
	cooldownTimer.connect("timeout", self, "on_cooldown_end")

func activate():
	active = true
	ready = false
	activeTimer.start(stats.activeTime)

func on_active_end():
	active = false
	activeTimer.stop()
	emit_signal("deactivate")
	cooldownTimer.start(stats.cooldownTime)

func on_cooldown_end():
	ready = true
	cooldownTimer.stop()

func is_ready_to_use():
	return not active and ready
