extends SubViewportContainer

@export var player: int = 1

func _ready():
	$SubViewport/Player.player = player

func _on_player_score_changed(score):
	$SubViewport/MarginContainer/StatsContainer/Score.text = str("SCORE ", score)
