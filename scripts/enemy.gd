extends CharacterBody2D
class_name enemy
var player: loki = null
var speed: float = 320.0
var dir := Vector2.ZERO

func _process(delta: float) -> void:
	if player != null:
		look_at(player.global_position)


func _physics_process(delta: float) -> void:

	if player != null:
		var e2p = (player.global_position - global_position)
		dir = e2p.normalized()
		
		if dir != Vector2.ZERO:
			velocity = speed * dir
		else: 
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.y = move_toward(velocity.y, 0, speed)
	move_and_slide()
	if player != null:
		look_at(player.global_position)




func _on_pdet_body_entered(body: Node2D) -> void:
	if body is loki:
		if player == null:
			player = body
