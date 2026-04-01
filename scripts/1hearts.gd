extends HBoxContainer


@onready var heartguiclass = preload("res://scenes/panel.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func setMaxHearts(max: int):
	max = max / 3
	for i in range(max):
		var heart = heartguiclass.instantiate()
		add_child(heart)

func updateHearts(health: int):
	var hearts = get_children()
	
	var fullhearts = health / 3
	
	for i in range(fullhearts):
		hearts[i].update(3)
	
	if fullhearts == hearts.size(): return
	var remainder = health % 3
	hearts[fullhearts].update(remainder)
	
	
	
	for i in range(fullhearts + 1, hearts.size()):
		hearts[i].update(0)
