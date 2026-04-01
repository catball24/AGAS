extends Node2D


func _on_button_pressed() -> void:
	$fade.show()
	$fade/fadeTimer.start()
	$fade/AnimationPlayer.play("fadeout")




func _on_fade_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/title.tscn")
