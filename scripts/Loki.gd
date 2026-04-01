extends CharacterBody2D
class_name loki
signal healthchange
var bite1 = 0
var inv = 0
var speed = 450
var shark = 1
var damage
var sharks_unlocked = 4
@export var maxhealth: int = 3*3
@onready var health: int = maxhealth
@onready var raycast1 = $bite/RayCast2D
@onready var raycast2 = $bite/RayCast2D2
@onready var raycast3 = $bite/RayCast2D3
@onready var raycast4 = $bite/RayCast2D4
@onready var raycast5 = $bite/RayCast2D5
@onready var invshow: MeshInstance2D = $MeshInstance2D
@onready var hitbox: CollisionShape2D = $hitbox/hitbox
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var body: Sprite2D = $body
@onready var bite: Area2D = $bite
@onready var timer: Timer = $invtimer
@onready var hurtsound: AudioStreamPlayer2D = $AudioStreamPlayer2D2
@onready var bitesound: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var jormangundrfight: Node2D = $".."
@onready var bitecd: Timer = $bitecd
@onready var animation_player: AnimationPlayer = $AnimationPlayer




func _ready() -> void:
	$body.offset = Vector2(102.875,-15)


func _physics_process(delta: float) -> void:

#sharks
	if Input.is_action_just_pressed("gw"):
		shark = 1
		body.frame = 0
		if $body.flip_h == false:
			$body.offset = Vector2(120.435,-20)
			$bite.position = Vector2(37.815,0)
			$bite.rotation = (3.14)
			collision.position = Vector2(28.333,1.667)
		elif $body.flip_h == true:
			$body.offset = Vector2(102.875,-15)
			$bite.position = Vector2(-1.525,0)
			$bite.rotation = (0)
			collision.position = Vector2(8.333,1.667)
	if shark == 1:
		if sharks_unlocked == 0:
			speed = 650
		else:
			speed = 350
		damage = 2
		hitbox.scale = Vector2(1.2,1.2)
		collision.scale = Vector2(1,1)
		$bite.scale = Vector2(1,1)
	if Input.is_action_just_pressed("lant") and sharks_unlocked >= 1:
		if $body.flip_h == false:
			$body.offset = Vector2(207.79,15.51)
			$bite.position = Vector2(15.24,5.17)
			$bite.rotation = (3.14)
		elif $body.flip_h == true:
			$body.offset = Vector2(-115.745,10.51)
			$bite.position = Vector2(2.01,4.12)
			$bite.rotation = (0)
		shark = 2
		body.frame = 24
	if shark == 2:
		speed = 500
		damage = .5
		hitbox.scale = Vector2(0.525,0.475)
		collision.scale = Vector2(0.325,0.275)
		$bite.scale = Vector2(0.385,0.385)
	if Input.is_action_just_pressed("thr") and sharks_unlocked >= 2:
		shark = 3
		if $body.flip_h == false:
			$body.offset = Vector2(140.43,16.02)
			$bite.position = Vector2(28.815,4.08)
			$bite.rotation = (3.14)
		elif $body.flip_h == true:
			$body.offset = Vector2(-29.29,10.02)
			$bite.position = Vector2(-13.425,4.08)
			$bite.rotation = (0)
		$body.frame = 6
	if shark == 3:
		speed = 450
		damage = 1
		hitbox.scale = Vector2(0.9,0.705)
		collision.scale = Vector2(0.7,0.505)
		$bite.scale = Vector2(1,1)
	if Input.is_action_just_pressed("lem") and sharks_unlocked >= 3:
		shark = 4
		$body.frame = 12
		if $body.flip_h == false:
			pass
		elif $body.flip_h == true:
			pass
	if shark == 4:
		speed = 400
		damage = .5
		hitbox.scale = Vector2(0.96, .69)
		collision.scale = Vector2(0.76, 0.49)
		$bite.scale = Vector2(1,1)
	if Input.is_action_just_pressed("bull") and sharks_unlocked >= 4:
		shark = 5
		$body.frame = 18
		if $body.flip_h == false:
			pass
		elif $body.flip_h == true:
			pass
	if shark == 5:
		speed = 500
		damage = 2
		hitbox.scale = Vector2(0.96, 0.99)
		collision.scale = Vector2(0.76, 0.79)
		$bite.scale = Vector2(1,1)

#move
	var move_dir = Vector2(Input.get_axis("moveL","moveR"), Input.get_axis("moveU","moveD"))
	if move_dir != Vector2.ZERO:
		velocity = speed * move_dir.normalized()
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

#flip
	if velocity.x < 0:
		$body.flip_h = false
		if shark == 1:
			$body.offset = Vector2(120.435,-20)
			$bite.position = Vector2(37.815,0)
			$bite.rotation = (3.14)
			collision.position = Vector2(28.333,1.667)
		elif shark == 2:
			$body.offset = Vector2(207.79,15.51)
			$bite.position = Vector2(15.24,5.17)
			$bite.rotation = (3.14)
		elif shark == 3:
			$body.offset = Vector2(140.43,16.02)
			$bite.position = Vector2(28.815,4.08)
			$bite.rotation = (3.14)
		elif shark == 4:
			$body.offset = Vector2(132.565,19.935)
			$bite.position = Vector2(24.715,-11.35)
			$bite.rotation = (2.79)
		elif shark == 5:
			$body.offset = Vector2(120.66,4.975)
			$bite.position = Vector2(23.815,0)
			$bite.rotation = (3.14)
	elif velocity.x > 0:
		$body.flip_h = true
		$bite.rotation = (0)
		if shark == 1:
			$body.offset = Vector2(102.875,-15)
			$bite.position = Vector2(-1.525,0)
			$bite.rotation = (0)
			collision.position = Vector2(8.333,1.667)
		elif shark == 2:
			$body.offset = Vector2(-115.745,10.51)
			$bite.position = Vector2(2.01,4.12)
			$bite.rotation = (0)
		elif shark == 3:
			$body.offset = Vector2(-29.29,10.02)
			$bite.position = Vector2(-13.425,4.08)
			$bite.rotation = (0)
		elif shark == 4:
			$body.offset = Vector2(-16.64,19.935)
			$bite.position = Vector2(4.06,-24.285)
			$bite.rotation = (.7)
		elif shark == 5:
			$body.offset = Vector2(-10.48,4.975)
			$bite.position = Vector2(-10.525,0)
			$bite.rotation = (0)

#attack
	if bite1 == 0:
		if Input.is_action_just_pressed("bite"):
			print("bite")
			bitesound.play()
			bite1 = 1
			bitecd.start()
			if shark == 1:
				animation_player.play("gwbite")
			if shark == 2:
				animation_player.play("lanbite")
			if shark == 3:
				animation_player.play("thrbite")
			if shark == 4:
				animation_player.play("lembite")
			if shark == 5:
				animation_player.play("bullbite")
			if raycast1.is_colliding() or raycast2.is_colliding() or raycast3.is_colliding() or raycast4.is_colliding() or raycast5.is_colliding():
				var collider1 = raycast1.get_collider()
				var collider2 = raycast2.get_collider()
				var collider3 = raycast3.get_collider()
				var collider4 = raycast4.get_collider()
				var collider5 = raycast5.get_collider()
				if collider3 is enemy4 or enemy7 or enemy8:
					print("crit")
					jormangundrfight.health -= damage * 2
				elif collider1 or collider2 or collider4 or collider5 is enemy4 or enemy7 or enemy8:
					print("dead")
					jormangundrfight.health -= damage


#special
	if Input.is_action_just_pressed("special"):
		if shark == 1:
			pass
		if shark == 2:
			pass
		if shark == 3:
			pass
		if shark == 4:
			pass
		if shark == 5:
			pass

	if Input.is_action_just_pressed("odin"):
		get_tree().change_scene_to_file("res://scenes/odinfight.tscn")
	if Input.is_action_just_pressed("jormangundr"):
		get_tree().change_scene_to_file("res://scenes/jormangundr.tscn")

	move_and_slide()

#damage
func _on_area_2d_body_entered(body: Node2D) -> void:
	if inv == 0:
		if body is enemy or enemy1 or enemy2 or enemy3 or enemy4 or enemy5 or enemy6 or enemy7 or enemy8 or enemy9:
			print("touched player")
			health -= 1
			print(health)
			timer.start()
			inv = 1
			invshow.show()
			healthchange.emit(health)
			hurtsound.play()



func _on_timer_timeout() -> void:
	inv = 0
	invshow.hide()


func _on_bitecd_timeout() -> void:
	bite1 = 0
