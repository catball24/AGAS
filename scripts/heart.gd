extends Panel

@onready var sprite: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func update(fraction: int):
	match  fraction:
		0: sprite.frame = 9
		1: sprite.frame = 6
		2: sprite.frame = 3
		3: sprite.frame = 0
