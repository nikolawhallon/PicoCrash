extends Area3D

const SPEED = 20.0
var velocity = Vector3(0, 0, 0)
var origin = null

func _process(delta):
	position += velocity * delta

func _on_body_entered(body):
	if body.is_in_group("Player"):
		if origin != null:
			origin.increase_score(1)
			velocity = SPEED * Vector3(0, 1, 0)
			position.y += 2
			rotation = Vector3(0, 0, 0)
