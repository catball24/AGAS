extends Node2D
@onready var chain_1: StaticBody2D = $chain1
@onready var player: loki = $player
@onready var hearts: HBoxContainer = $CanvasLayer/hearts
@onready var fade: ColorRect = $fade
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$fade/AnimationPlayer.play("fadein")
	hearts.setMaxHearts(player.maxhealth)
	hearts.updateHearts(player.health)
	player.healthchange.connect(hearts.updateHearts)


func _on_control_chain() -> void:
	remove_child(chain_1)
