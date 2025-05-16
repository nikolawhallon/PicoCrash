extends SubViewportContainer

@export var player: int = 1

func _ready():
	$SubViewport/Player.player = player

func _on_player_score_changed(score):
	$SubViewport/MarginContainer/StatsContainer/Score.text = str("SCORE ", score)

func _on_player_conkes_changed(conkes):
	$SubViewport/MarginContainer/AmmoContainer/ConkeLabel.text = str(conkes)

func _on_player_bepises_changed(bepises):
	$SubViewport/MarginContainer/AmmoContainer/BepisLabel.text = str(bepises)
	
func _on_player_health_changed(health):
	$SubViewport/MarginContainer/StatsContainer/Health.text = str("HEALTH ", health)
