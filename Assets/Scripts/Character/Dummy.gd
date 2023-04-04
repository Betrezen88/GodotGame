extends KinematicBody2D

export var frozen_effect_path : NodePath

onready var healthBar = $HealthBar
onready var health = $Health
onready var healthRestore = $HealthRestore
onready var hurtBox = $HurtBox

onready var frozenEffect = get_node(frozen_effect_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	health.connect("value_changed", healthBar, "set_value")
	healthRestore.connect("restore", health, "increase")
	hurtBox.connect("damage_received", health, "deacrease")
	hurtBox.connect("damage_received", frozenEffect, "add_value")
	
	healthBar.set_max_value(health.max_value)
	healthBar.set_value(health.current)

