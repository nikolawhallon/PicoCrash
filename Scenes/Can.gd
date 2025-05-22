extends Area3D

var speed = 40.0
var velocity = Vector3(0, 0, 0)
var origin = null

func _process(delta):
	position += velocity * delta
	
	if position.y > 100:
		get_tree().queue_delete(self)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		if body.invincible:
			return
		if origin != null:
			origin.increase_score(1)
			body.decrease_health(1)

	velocity = speed * Vector3(0, 1, 0)
	position.y += 2
	rotation = Vector3(0, 0, 0)

func _on_area_entered(area):
	if area.is_in_group("Bepis") or area.is_in_group("Conke"):
		velocity = speed * Vector3(0, 1, 0)
		position.y += 2
		rotation = Vector3(0, 0, 0)

		area.velocity = speed * Vector3(0, 1, 0)
		area.position.y += 2
		area.rotation = Vector3(0, 0, 0)
