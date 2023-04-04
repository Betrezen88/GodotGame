extends Node2D

onready var progress = $TextureProgress

func set_value(value) -> void:
	progress.value = value

func set_max_value(value) -> void:
	progress.max_value = value
