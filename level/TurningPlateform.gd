extends Node3D

@export var speed: float = 2


func _process(delta: float) -> void:
	global_rotation.y += speed * delta
