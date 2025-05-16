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

	var player_num = 2
	
	if player_num == 2:
		var player1 = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		player1.player = 1
		player1.size = Vector2(640, 240)
		player1.get_node("SubViewport").size = Vector2(640, 240)
		player1.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 20)
		add_child(player1)

		var player2 = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		player2.player = 2
		player2.size = Vector2(640, 240)
		player2.get_node("SubViewport").size = Vector2(640, 240)
		player2.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 15)
		player2.position = Vector2(0, 240)
		add_child(player2)

	if player_num == 3:
		var player1 = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		player1.player = 1
		player1.size = Vector2(320, 240)
		player1.get_node("SubViewport").size = Vector2(320, 240)
		player1.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 20)
		add_child(player1)

		var player2 = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		player2.player = 2
		player2.size = Vector2(320, 240)
		player2.get_node("SubViewport").size = Vector2(320, 240)
		player2.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 15)
		player2.position = Vector2(320, 0)
		add_child(player2)

		var player3 = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		player3.player = 3
		player3.size = Vector2(320, 240)
		player3.get_node("SubViewport").size = Vector2(320, 240)
		player3.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 10)
		player3.position = Vector2(0, 240)
		add_child(player3)

	if player_num == 4:
		var player1 = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		player1.player = 1
		player1.size = Vector2(320, 240)
		player1.get_node("SubViewport").size = Vector2(320, 240)
		player1.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 20)
		add_child(player1)

		var player2 = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		player2.player = 2
		player2.size = Vector2(320, 240)
		player2.get_node("SubViewport").size = Vector2(320, 240)
		player2.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 15)
		player2.position = Vector2(320, 0)
		add_child(player2)

		var player3 = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		player3.player = 3
		player3.size = Vector2(320, 240)
		player3.get_node("SubViewport").size = Vector2(320, 240)
		player3.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 10)
		player3.position = Vector2(0, 240)
		add_child(player3)
		
		var player4 = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		player4.player = 4
		player4.size = Vector2(320, 240)
		player4.get_node("SubViewport").size = Vector2(320, 240)
		player4.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 5)
		player4.position = Vector2(320, 240)
		add_child(player4)
	
func _process(delta):
	pass
