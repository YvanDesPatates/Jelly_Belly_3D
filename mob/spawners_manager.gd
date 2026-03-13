extends Node
class_name spawners_manager

@export var spawners: Array[spawner]

func _on_spawn_timer_timeout() -> void:
	spawners.pick_random().spawn_mob()

func is_actual_spawner(obj: Node):
	return  obj != null	
