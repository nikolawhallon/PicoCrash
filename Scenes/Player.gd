extends CharacterBody3D

signal score_changed(score)
signal health_changed(health)
signal conkes_changed(conkes)
signal bepises_changed(bepises)

@export var player: int = 1

var speed = 10.0
var boost = Vector3(0, 0, 0)

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var camera_model_angle = 0
var score = 0
var health = 3
var conkes = 0
var bepises = 0

func reset():
	print("reset")
	health = 3
	conkes = 0
	bepises = 0
	boost = Vector3(0, 0, 0)
	emit_signal("score_changed", score)
	emit_signal("health_changed", health)
	emit_signal("conkes_changed", conkes)
	emit_signal("bepises_changed", bepises)
	
func _physics_process(delta):
	if health <= 0:
		return

	if Input.is_action_just_pressed(str("p", player, "_fire_conke")) and conkes > 0:
		var conke = load("res://Scenes/Conke.tscn").instantiate()
		conke.global_position = global_position + 4 * Vector3(sin($ChunkyTank.rotation.y), 0, cos($ChunkyTank.rotation.y))
		conke.velocity = conke.speed * Vector3(sin($ChunkyTank.rotation.y), 0, cos($ChunkyTank.rotation.y))
		conke.rotation.z = PI / 2
		conke.rotation.y = $ChunkyTank.rotation.y + PI / 2
		conke.origin = self
		get_tree().get_root().add_child(conke)
		conkes -= 1
		emit_signal("conkes_changed", conkes)

	if Input.is_action_just_pressed(str("p", player, "_fire_bepis")) and bepises > 0:
		var bepis = load("res://Scenes/Bepis.tscn").instantiate()
		bepis.global_position = global_position + 4 * Vector3(sin($ChunkyTank.rotation.y), 0, cos($ChunkyTank.rotation.y))
		bepis.velocity = bepis.speed * Vector3(sin($ChunkyTank.rotation.y), 0, cos($ChunkyTank.rotation.y))
		bepis.rotation.z = PI / 2
		bepis.rotation.y = $ChunkyTank.rotation.y + PI / 2
		bepis.origin = self
		get_tree().get_root().add_child(bepis)
		bepises -= 1
		emit_signal("bepises_changed", bepises)

	if Input.is_action_just_pressed(str("p", player, "_boost")):
		$BoostTimer.start()
		boost = 2 * speed * Vector3(sin($ChunkyTank.rotation.y), 0, cos($ChunkyTank.rotation.y))

	if not is_on_floor():
		velocity.y -= gravity * delta

	# move the player based on the input and the camera position/angle
	var input_dir = Input.get_vector(str("p", player, "_left"), str("p", player, "_right"), str("p", player, "_up"), str("p", player, "_down"))
	input_dir = input_dir.rotated(-camera_model_angle)
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		$ChunkyTank.rotation.y = atan2(direction.x, direction.z)
		velocity += boost
	else:
		velocity.x = boost.x
		velocity.z = boost.z
			
	move_and_slide()
	
	for i in get_slide_collision_count() - 1:
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider.is_in_group("Jidouhanbaiki"):
			conkes = 9
			bepises = 9
			emit_signal("conkes_changed", conkes)
			emit_signal("bepises_changed", bepises)
			
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

func increase_score(increment):
	if health <= 0:
		return
		
	score += increment
	score_changed.emit(score)

func decrease_health(decrement):
	if health <= 0:
		return
		
	health -= decrement
	health_changed.emit(health)

	if health <= 0:
		score = score / 2
		score_changed.emit(score)
		visible = false
		global_position.y += 4
		$RespawnTimer.start()

func _on_respawn_timer_timeout():
	reset()
	visible = true

func _on_boost_timer_timeout():
	boost = Vector3(0, 0, 0)
