extends Node
class_name spawners_manager

static var spawners: Array[spawner]

static func declare_new_spawner(new_spawner: spawner):
	spawners.append(new_spawner)

func _on_spawn_timer_timeout() -> void:
	spawners.pick_random().spawn_mob()
