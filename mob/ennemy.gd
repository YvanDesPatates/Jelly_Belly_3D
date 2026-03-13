extends RigidBody3D

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var player: Node3D = get_node("/root/Game/Player")
@onready var GAME: Node3D = get_node("/root/Game")

const SPEED = 3
var life = 4

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	look_at(player.global_position)
	linear_velocity = global_transform.basis * Vector3(0,0,-SPEED)


func take_damage():
	life -= 1
	if life == 0:
		queue_free()
		const SMOKE_PUFF = preload("uid://cjk3frr43yesb")
		var smoke: Node3D = SMOKE_PUFF.instantiate()
		smoke.global_position = global_position
		GAME.add_child(smoke)
	else :
		animation_player.play("hurt")
