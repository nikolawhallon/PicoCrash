extends Area3D

func _ready():
	rotation.x = PI / 6

func _process(delta):
	rotation.y += 1 * delta

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.increase_minteses(1)
		get_tree().queue_delete(self)
