extends Label
@onready var label: Label = $"."
var scrollspeed = 70
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("speedup"):
		$".".position.y -= (scrollspeed*3)*delta
	else:
		$".".position.y -= scrollspeed*delta

	if $".".position.y <= -4659.0:
		get_tree().change_scene_to_file("res://scenes/title.tscn")
