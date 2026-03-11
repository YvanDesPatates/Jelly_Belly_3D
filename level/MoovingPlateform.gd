extends Node3D

## direction where the plateform will go. Once it has passed the limit distance, go reverse-side.
@export var moove_direction: Vector3 = Vector3.FORWARD
## limit distance from the start position to the max and min pos.
@export var limit_distance: float = 10.00
@export var speed:float = 2.00

var starting_point: Vector3

func _ready() -> void:
	starting_point = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var pos = global_position
	global_position += moove_direction * speed * delta
	var distance_travelled = abs(starting_point.distance_to(global_position))
	var limit_has_been_reached = distance_travelled >= limit_distance
	var new_pos = global_position
	if limit_has_been_reached :
		global_position = starting_point + moove_direction * limit_distance
		moove_direction *= Vector3(-1, -1, -1)
