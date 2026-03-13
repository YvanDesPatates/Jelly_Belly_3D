extends Node

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().paused = false
		get_tree().reload_current_scene()
