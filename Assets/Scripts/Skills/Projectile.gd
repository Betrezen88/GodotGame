class_name Projectile
extends Node2D

# ---- Members ----
export(NodePath) var hitbox_path
export(NodePath) var impact_detector_path
export(NodePath) var range_component_path
export(NodePath) var animated_sprite_path
export(NodePath) var chargeable_path

export var effects = []

export var speed := 1000.0

onready var hitbox = get_node(hitbox_path)
onready var impact_detector = get_node(impact_detector_path)
onready var range_component = get_node(range_component_path)
onready var animated_sprite = get_node(animated_sprite_path)

var chargeable : Node2D = null
var direction = Vector2.ZERO

# ---- Methods ----
# Called when the node enters the scene tree for the first time.
func _ready():
	if !chargeable_path.is_empty():
		print("Fetching chargeable: ", chargeable_path)
		chargeable = get_node(chargeable_path)
	
	if chargeable != null:
		print("Chargeable is not null")
	
	set_as_toplevel(true)
	look_at(position + direction)
	
	animated_sprite.play("default")
	
	impact_detector.connect("body_entered", self, "_on_impact")
	range_component.connect("max_range_reached", self, "queue_free")

func _physics_process(delta: float) ->void:
	position += direction * speed * delta

func _on_impact(_body: Node) -> void:
	queue_free()

func is_chargeable() -> bool:
	return chargeable != null
