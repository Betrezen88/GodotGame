extends KinematicBody2D

# public variables
export var player_stats_scene : NodePath
export var staff_scene : NodePath

onready var inputController = $InputController

# private variables
onready var player_stats = get_node(player_stats_scene)
onready var staff = get_node(staff_scene)
onready var current_speed : float = player_stats.speed

# -------- Methods -----------------
# Called when the node enters the scene tree for the first time.
func _ready():
	if staff != null:
		staff.connect("speed_update", self, "set_current_speed")
		inputController.connect("attack_1_primary_pressed", staff, "gem_1_attack_primary_pressed")
		inputController.connect("attack_1_primary_released", staff, "gem_1_attack_primary_released")
		inputController.connect("attack_1_secondary_pressed", staff, "gem_1_attack_secondary_pressed")
		inputController.connect("attack_1_secondary_released", staff, "gem_1_attack_secondary_released")
		inputController.connect("attack_2_primary_pressed", staff, "gem_2_attack_primary_pressed")
		inputController.connect("attack_2_primary_released", staff, "gem_2_attack_primary_released")
		inputController.connect("attack_2_secondary_pressed", staff, "gem_2_attack_secondary_pressed")
		inputController.connect("attack_2_secondary_released", staff, "gem_2_attack_secondary_released")
		inputController.connect("dash_pressed", staff, "on_dash_pressed")

func _physics_process(_delta):
	# Rotate player torward mouse cursor
	# look_at(get_global_mouse_position())
	# Move player in given direction
	#move_and_slide(get_directional_input().normalized() * current_speed)
	move_and_slide(inputController.get_directional_input().normalized() * current_speed)

func set_current_speed(speed : float) -> void:
	current_speed = player_stats.speed + speed
