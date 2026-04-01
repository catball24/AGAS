extends Node2D
var isattacking = 0
var attack 
var health = 1
var phase = 1
@onready var player: loki = $player
@onready var hearts: HBoxContainer = $CanvasLayer/hearts
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer



	
func _ready() -> void:
	hearts.setMaxHearts(player.maxhealth)
	hearts.updateHearts(player.health)
	player.healthchange.connect(hearts.updateHearts)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:

	if isattacking == 0:
		if phase == 1:
			if attack == 0:
				pass
			elif attack == 1:
				pass
			elif attack == 2:
				pass
		elif phase == 2:
			if attack == 0:
				pass
			elif attack == 1:
				pass
			elif attack == 2:
				pass
	if health <= 500:
		phase = 2
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/main_room2.tscn")



func _on_timer_timeout() -> void:
	attack = int(randf_range(0,2))


func _on_audio_stream_player_finished() -> void:
	audio_stream_player.play()
