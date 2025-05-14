extends CharacterBody3D

@export var player: int = 1

const SPEED = 10.0

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var camera_model_angle = 0

func _physics_process(delta):
	#if not is_on_floor():
	#	velocity.y -= gravity * delta

	# move the player based on the input and the camera position/angle
	var input_dir = Input.get_vector(str("p", player, "_left"), str("p", player, "_right"), str("p", player, "_up"), str("p", player, "_down"))
	input_dir = input_dir.rotated(-camera_model_angle)
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		$ChunkyTank.rotation.y = atan2(direction.x, direction.z)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()

	# move and reposition the camera w.r.t. the player's position
	if Input.is_action_pressed(str("p", player, "_l")):
		camera_model_angle += 2 * delta
	if Input.is_action_pressed(str("p", player, "_r")):
		camera_model_angle -= 2 * delta

	$Camera3D.global_position = global_position + 10 * Vector3(sin(camera_model_angle), 0, cos(camera_model_angle))
	$Camera3D.global_position.y = 4
	var dx = global_position.x - $Camera3D.global_position.x
	var dz = global_position.z - $Camera3D.global_position.z
	$Camera3D.rotation.y = -atan2(dx, -dz)
