extends StaticBody3D
class_name spawner

const ENNEMY = preload("uid://cy48d7vcv2jyb")
@onready var GAME: Node3D = get_node("/root/Game")

func _ready() -> void:
	spawners_manager.declare_new_spawner(self)

func spawn_mob():
	var new_ennemy: Node3D = ENNEMY.instantiate()
	new_ennemy.global_position = global_position + Vector3.DOWN
	GAME.add_child(new_ennemy)
	
	
