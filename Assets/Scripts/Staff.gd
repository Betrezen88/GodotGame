extends Node2D

# TODO: staff should be generated ?

# dash skill
onready var dash = $Dash
# shield skill

# members
# skill spawn point
onready var skill_spawn_point = $SkillSpawnPoint

# gems
export var gem_1_path : NodePath
export var gem_2_path : NodePath

onready var gem_1 := get_node(gem_1_path)
onready var gem_2 := get_node(gem_2_path)

signal speed_update(new_speed)

func _ready() -> void:
	dash.connect("dash_speed", self, "set_dash_speed")

func gem_1_attack_primary_pressed() -> void:
	if gem_1.is_primary_chargeable():
		print("gem 1 attack secondary is chargable")
	#print("gem 1 attack primary pressed")

func gem_1_attack_primary_released() -> void:
	#print("gem 1 attack primary released")
	gem_1.attack_primary()

func gem_1_attack_secondary_pressed() -> void:
	if gem_1.is_secondary_chargable():
		print("gem 2 attack secondary is chargable")
	#print("gem 1 attack secondary pressed")

func gem_1_attack_secondary_released() -> void:
	#print("gem 1 attack secondary released")
	gem_1.attack_secondary()

func gem_2_attack_primary_pressed() -> void:
	if gem_2.is_primary_chargeable():
		print("gem 2 attack secondary is chargable")
	#print("gem 2 attack primary pressed")

func gem_2_attack_primary_released() -> void:
	#print("gem 2 attack primary released")
	gem_2.attack_primary()

func gem_2_attack_secondary_pressed() -> void:
	if gem_2.is_secondary_chargable():
		print("gem 2 attack secondary is chargable")

func gem_2_attack_secondary_released() -> void:
	#print("gem 2 attack secondary released")
	gem_2.attack_secondary()

func on_dash_pressed() -> void:
	dash.use()

func set_dash_speed(speed : float) -> void:
	emit_signal("speed_update", speed)
