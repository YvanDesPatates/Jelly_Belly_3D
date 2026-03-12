extends RigidBody3D

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var player: Node3D = get_node("/root/Game/Player")

const SPEED = 3

func _physics_process(delta: float) -> void:
	look_at(player.global_position)
	linear_velocity = global_transform.basis * Vector3(0,0,-SPEED)

func take_damage():
	print_debug("touch")
	animation_player.play("hurt")
