extends CharacterBody2D
class_name enemy8
var speed = 800

func _process(delta):
	position.y += speed * delta
