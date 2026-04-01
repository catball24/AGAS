extends CharacterBody2D
class_name enemy1
var player: loki = null
var speed: float = 1000.0
var dir := Vector2.ZERO
var moving 
@onready var timer_2: Timer = $Timer2
@onready var timer_3: Timer = $Timer3
@onready var timer: Timer = $Timer

func _ready() -> void:
	if player != null:
		look_at(player.global_position)


func _physics_process(delta: float) -> void:
	if moving == 1:
		if player != null:
			
			
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


func _on_timer_timeout() -> void:
	if player != null:
		look_at(player.global_position)


func _on_timer_2_timeout() -> void:
	var e2p = (player.global_position - global_position)
	dir = e2p.normalized()
	moving = 1
	timer_3.start()

func _on_timer_3_timeout() -> void:
	moving = 0
	timer_2.start()
