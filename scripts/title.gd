extends Node2D

@onready var fade: ColorRect = $fade
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.

var button_type

func _ready() -> void:
	$fade/AnimationPlayer.play("fadein")
	audio_stream_player.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	button_type = "start"
	$fade.show()
	$fade/fadeTimer.start()
	$fade/AnimationPlayer.play("fadeout")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	button_type = "credits"
	$fade.show()
	$fade/fadeTimer.start()
	$fade/AnimationPlayer.play("fadeout")


func _on_fade_timer_timeout() -> void:
	if button_type == "start":
		get_tree().change_scene_to_file("res://scenes/main_room.tscn")
	elif button_type == "credits":
		get_tree().change_scene_to_file("res://scenes/credits2.tscn")
