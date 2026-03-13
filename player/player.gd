extends CharacterBody3D

const SPEED = 9
const JUMP_FORCE = 10
var x_sensitivity = 0.4#0.2 is very slow while 0.9 is fast
var y_sensitivity = 0.2
var max_y_rotation = 60
var min_y_rotation = -60

var impulse_ennemy_touch: Vector3 = Vector3.ZERO
var player_can_move = true

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * x_sensitivity
		%Camera3D.rotation_degrees.x -= event.relative.y * y_sensitivity
		%Camera3D.rotation_degrees.x = clamp(%Camera3D.rotation_degrees.x, min_y_rotation	, max_y_rotation)
		
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _physics_process(delta: float) -> void:
	if impulse_ennemy_touch != Vector3.ZERO :
		player_can_move = false
		velocity = impulse_ennemy_touch 
		impulse_ennemy_touch *= Vector3.ZERO
	elif is_on_floor():
		player_can_move = true
	
	if player_can_move:
		compute_player_movement(delta)
	
	velocity.y -= 20 * delta
	move_and_slide()
	
	if Input.is_action_pressed("shoot"):
		shoot_bullet()

func compute_player_movement(delta):	
	var input_direction_2d = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var input_direction_3d = Vector3(input_direction_2d.x, 0.0 , input_direction_2d.y)
	var direction = transform.basis * input_direction_3d
	
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_FORCE
	elif Input.is_action_just_released("jump") and velocity.y > 0:
		velocity.y = 0.5


func shoot_bullet():
	if ! %GunCooldwonTimer.is_stopped():
		return
	
	%GunCooldwonTimer.start()
	var bullet_scene = preload("uid://c5v85vh3dfudi")
	var bullet: Node3D = bullet_scene.instantiate()
	%BulletMarker3D.add_child(bullet)
	
	bullet.global_transform = %BulletMarker3D.global_transform


func _on_hitbox_body_entered(body: Node3D) -> void:
	impulse_ennemy_touch = transform.basis * Vector3(0, 15, 12)
