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
		var p1_sub_viewport = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		p1_sub_viewport.player = 1
		p1_sub_viewport.size = Vector2(640, 240)
		p1_sub_viewport.get_node("SubViewport").size = Vector2(640, 240)
		p1_sub_viewport.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 20)
		add_child(p1_sub_viewport)

		var p2_sub_viewport = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		p2_sub_viewport.player = 2
		p2_sub_viewport.size = Vector2(640, 240)
		p2_sub_viewport.get_node("SubViewport").size = Vector2(640, 240)
		p2_sub_viewport.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 15)
		p2_sub_viewport.position = Vector2(0, 240)
		add_child(p2_sub_viewport)

	if player_num == 3:
		var p1_sub_viewport = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		p1_sub_viewport.player = 1
		p1_sub_viewport.size = Vector2(320, 240)
		p1_sub_viewport.get_node("SubViewport").size = Vector2(320, 240)
		p1_sub_viewport.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 20)
		add_child(p1_sub_viewport)

		var p2_sub_viewport = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		p2_sub_viewport.player = 2
		p2_sub_viewport.size = Vector2(320, 240)
		p2_sub_viewport.get_node("SubViewport").size = Vector2(320, 240)
		p2_sub_viewport.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 15)
		p2_sub_viewport.position = Vector2(320, 0)
		add_child(p2_sub_viewport)

		var p3_sub_viewport = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		p3_sub_viewport.player = 3
		p3_sub_viewport.size = Vector2(320, 240)
		p3_sub_viewport.get_node("SubViewport").size = Vector2(320, 240)
		p3_sub_viewport.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 10)
		p3_sub_viewport.position = Vector2(0, 240)
		add_child(p3_sub_viewport)

	if player_num == 4:
		var p1_sub_viewport = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		p1_sub_viewport.player = 1
		p1_sub_viewport.size = Vector2(320, 240)
		p1_sub_viewport.get_node("SubViewport").size = Vector2(320, 240)
		p1_sub_viewport.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 20)
		add_child(p1_sub_viewport)

		var p2_sub_viewport = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		p2_sub_viewport.player = 2
		p2_sub_viewport.size = Vector2(320, 240)
		p2_sub_viewport.get_node("SubViewport").size = Vector2(320, 240)
		p2_sub_viewport.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 15)
		p2_sub_viewport.position = Vector2(320, 0)
		add_child(p2_sub_viewport)

		var p3_sub_viewport = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		p3_sub_viewport.player = 3
		p3_sub_viewport.size = Vector2(320, 240)
		p3_sub_viewport.get_node("SubViewport").size = Vector2(320, 240)
		p3_sub_viewport.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 10)
		p3_sub_viewport.position = Vector2(0, 240)
		add_child(p3_sub_viewport)
		
		var p4_sub_viewport = load("res://Scenes/PlayerSubViewport.tscn").instantiate()
		p4_sub_viewport.player = 4
		p4_sub_viewport.size = Vector2(320, 240)
		p4_sub_viewport.get_node("SubViewport").size = Vector2(320, 240)
		p4_sub_viewport.get_node("SubViewport").get_node("Player").global_position = Vector3(10, 2, 5)
		p4_sub_viewport.position = Vector2(320, 240)
		add_child(p4_sub_viewport)
	
func _process(delta):
	pass
