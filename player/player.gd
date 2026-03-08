extends CharacterBody3D

var x_sensitivity = 0.4#0.2 is very slow while 0.9 is fast
var y_sensitivity = 0.2
var max_y_rotation = 60
var min_y_rotation = -60

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * x_sensitivity
		%Camera3D.rotation_degrees.x -= event.relative.y * y_sensitivity
		%Camera3D.rotation_degrees.x = clamp(%Camera3D.rotation_degrees.x, min_y_rotation	, max_y_rotation)
		
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
