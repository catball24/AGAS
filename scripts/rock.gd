extends CharacterBody2D
class_name enemy9
var speed = 500

func _process(delta):
	position.y += speed * delta
