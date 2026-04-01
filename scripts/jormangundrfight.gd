extends Node2D
var upordown = randi_range(0,1)
var attacktim 
var isattacking = 0
var attack 
var health = 1
var phase = 1
@onready var camera_2d: Camera2D = $Camera2D
@onready var rock: Timer = $rock
@onready var midrush: Timer = $midrush
@onready var startrush: Timer = $startrush
@onready var rushtim: Timer = $rushtim
@onready var slitherio: Timer = $slitherio
@onready var player: loki = $player
@onready var hearts: HBoxContainer = $CanvasLayer/hearts
@onready var top: enemy4 = $jormanundrbodytop
@onready var bottom: enemy4 = $jormanundrbodytop2
@onready var right: enemy4 = $jormanundrbodytop3
@onready var left: enemy4 = $jormanundrbodytop4
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
const JORMANUNDRBODY_L = preload("uid://b57m1ekj622bs")
const JORMANUNDRBODY_R = preload("uid://bnbj7qujg0qrs")
const JORMANUNDRUP = preload("uid://bk5rxk3q112ue")
const JORMANUNDRDOWN = preload("uid://d3og4ooqgc04j")
const ROCK = preload("uid://didpllfunwg00")
var rock1 = ROCK.instantiate()
var rock6 = ROCK.instantiate()
var rock2 = ROCK.instantiate()
var rock3 = ROCK.instantiate()
var rock4 = ROCK.instantiate()
var rock5 = ROCK.instantiate()
var jd = JORMANUNDRDOWN.instantiate()
var ju = JORMANUNDRUP.instantiate()
var jl = JORMANUNDRBODY_L.instantiate()
var jr = JORMANUNDRBODY_R.instantiate()
# Called when the node enters the scene tree for the first time.


	
func _ready() -> void:
	hearts.setMaxHearts(player.maxhealth)
	hearts.updateHearts(player.health)
	player.healthchange.connect(hearts.updateHearts)
	rock1.position = Vector2(randi_range(-627,1819),-714)
	rock2.position = Vector2(randi_range(-627,1819),-714)
	rock3.position = Vector2(randi_range(-627,1819),-714)
	rock4.position = Vector2(randi_range(-627,1819),-714)
	rock5.position = Vector2(randi_range(-627,1819),-714)
	rock6.position = Vector2(randi_range(-627,1819),-714)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if player.health == 0:
		get_tree().change_scene_to_file("res://scenes/badend.tscn")
	if isattacking == 0:
		if phase == 1:
			if attack == 0:
				if upordown == 0:
					jl.position = Vector2(-4924.0,7.0)
					jr.position = Vector2(17000.0,606)
					add_child(jr)
					add_child(jl)
					isattacking = 1
					rushtim.start()
				if upordown == 1:
					jr.position = Vector2(17000.0,7.0)
					jl.position = Vector2(-4924.0,606)
					add_child(jr)
					add_child(jl)
					isattacking = 1
					rushtim.start()
			elif attack == 1:
				if upordown == 0:
					ju.position = Vector2(1132.0,9725.001)
					jd.position = Vector2(-172.0,-5762.0)
					add_child(ju)
					add_child(jd)
					isattacking = 1
					slitherio.start()
				if upordown == 1:
					ju.position = Vector2(-172,9725.001)
					jd.position = Vector2(1132.0,-5762.0)
					add_child(ju)
					add_child(jd)
					isattacking = 1
					slitherio.start()
			elif attack == 2:
				add_child(rock1)
				add_child(rock2)
				add_child(rock3)
				add_child(rock4)
				add_child(rock5)
				add_child(rock6)
				isattacking = 1
				rock.start()
		elif phase == 2:
			if attack == 0:
				if upordown == 0:
					jl.position = Vector2(-4924.0,7.0)
					jr.position = Vector2(17000.0,606)
					add_child(jr)
					add_child(jl)
					isattacking = 1
					add_child(rock1)
					add_child(rock2)
					add_child(rock3)
					add_child(rock4)
					add_child(rock5)
					add_child(rock6)
					startrush.start()
					rushtim.start()
				if upordown == 1:
					jr.position = Vector2(17000.0,7.0)
					jl.position = Vector2(-4924.0,606)
					add_child(jr)
					add_child(jl)
					add_child(rock1)
					add_child(rock2)
					add_child(rock3)
					add_child(rock4)
					add_child(rock5)
					add_child(rock6)
					startrush.start()
					isattacking = 1
					rushtim.start()
			elif attack == 1:
				if upordown == 0:
					ju.position = Vector2(1132.0,9725.001)
					jd.position = Vector2(-172.0,-5762.0)
					add_child(ju)
					add_child(jd)
					isattacking = 1
					slitherio.start()
				if upordown == 1:
					ju.position = Vector2(-172,9725.001)
					jd.position = Vector2(1132.0,-5762.0)
					add_child(ju)
					add_child(jd)
					isattacking = 1
					slitherio.start()
			elif attack == 2:
				attack = int(randf_range(0,2))
	if health <= 500:
		phase = 2
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/main_3.tscn")

func _on_rushtim_timeout() -> void:
	remove_child(jr)
	remove_child(jl)
	isattacking = 0
	attack = int(randf_range(0,2))


func _on_slitherio_timeout() -> void:
	remove_child(ju)
	remove_child(jd)
	remove_child(rock1)
	remove_child(rock2)
	remove_child(rock3)
	remove_child(rock4)
	remove_child(rock5)
	remove_child(rock6)
	isattacking = 0
	attack = int(randf_range(0,2))


func _on_rock_timeout() -> void:
	attack = int(randf_range(0,2))
	remove_child(rock1)
	remove_child(rock2)
	remove_child(rock3)
	remove_child(rock4)
	remove_child(rock5)
	remove_child(rock6)
	isattacking = 0



func _on_startrush_timeout() -> void:
	rock1.position = Vector2(randi_range(-627,1819),-714)
	rock2.position = Vector2(randi_range(-627,1819),-714)
	rock3.position = Vector2(randi_range(-627,1819),-714)
	rock4.position = Vector2(randi_range(-627,1819),-714)
	rock5.position = Vector2(randi_range(-627,1819),-714)
	rock6.position = Vector2(randi_range(-627,1819),-714)
	midrush.start()


func _on_midrush_timeout() -> void:
	rock1.position = Vector2(randi_range(-627,1819),-714)
	rock2.position = Vector2(randi_range(-627,1819),-714)
	rock3.position = Vector2(randi_range(-627,1819),-714)
	rock4.position = Vector2(randi_range(-627,1819),-714)
	rock5.position = Vector2(randi_range(-627,1819),-714)
	rock6.position = Vector2(randi_range(-627,1819),-714)


func _on_timer_timeout() -> void:
	attack = int(randf_range(0,2))


func _on_audio_stream_player_finished() -> void:
	audio_stream_player.play()
