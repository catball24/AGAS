extends CharacterBody2D
class_name enemy2
var speed = 500

func _process(delta):
	position.x -= speed * delta
