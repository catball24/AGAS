extends Node
@onready var player: loki = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.died.connect(_on_player_died())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_player_died():
	get_tree().reload_current_scene()
	get_tree().change_scene_to_file("res://scenes/badend.tscn")
