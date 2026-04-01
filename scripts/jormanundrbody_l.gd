extends CharacterBody2D
class_name enemy6
var speed = 800

func _process(delta):
	position.x += speed * delta
