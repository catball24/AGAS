extends CharacterBody2D
class_name enemy3
var speed = 500
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer
var attack = randi_range(0,2)
func _process(delta):
	position.y += speed * delta
	attack = randi_range(0,2)
func _ready() -> void:
	if attack == 0:
		animation_player.play("bones")
	if attack == 1:
		animation_player.play("axe")
	if attack == 2:
		animation_player.play("shield")
