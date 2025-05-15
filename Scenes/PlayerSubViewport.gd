extends SubViewportContainer

func _on_player_score_changed(score):
	$SubViewport/MarginContainer/HBoxContainer/Label.text = str("SCORE ", score)
