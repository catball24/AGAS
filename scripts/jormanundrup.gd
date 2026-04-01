extends CharacterBody2D
class_name enemy7
var speed = 800

func _process(delta):
	position.y -= speed * delta
