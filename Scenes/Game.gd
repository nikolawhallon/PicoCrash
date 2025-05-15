extends Node3D

func _ready():
	for i in 11:
		var warning = load("res://Scenes/Warning.tscn").instantiate()
		warning.rotation.y = PI / 2
		warning.position.x = -40 + i * 8
		warning.position.y = 0.5
		warning.position.z = 48
		add_child(warning)

	for i in 11:
		var warning = load("res://Scenes/Warning.tscn").instantiate()
		warning.rotation.y = PI / 2
		warning.position.x = -40 + i * 8
		warning.position.y = 0.5
		warning.position.z = -48
		add_child(warning)

	for i in 11:
		var warning = load("res://Scenes/Warning.tscn").instantiate()
		warning.position.z = -40 + i * 8
		warning.position.y = 0.5
		warning.position.x = 48
		add_child(warning)

	for i in 11:
		var warning = load("res://Scenes/Warning.tscn").instantiate()
		warning.position.z = -40 + i * 8
		warning.position.y = 0.5
		warning.position.x = -48
		add_child(warning)

func _process(delta):
	pass
