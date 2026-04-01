extends Control

@export_file("*.json") var jsonsrc
var scenescript: Dictionary
var currentblock: Dictionary
var nextblock: Dictionary
var dialogue 
@export_category("scene ref")
@export var chartext: Label
@export var charname: Label
@export var charsprite: Sprite2D
@export var baselayer: CanvasLayer
@export var choicelayer: CanvasLayer
# Called when the node enters the scene tree for the first time.



func get_json(src: String):
	var jsontext = FileAccess.get_file_as_string(src)
	scenescript = JSON.parse_string(jsontext)
	currentblock = scenescript["start"]

func load_block(block: Dictionary):
	if block.has("text"): chartext.text = block["text"]
	if block.has("name"): charname.text = block["name"]
	if block.has("next"):
		var key = block["next"]
		nextblock = scenescript[key]
	if block.has("choices"):
		choicelayer.show()
		choicelayer.set_choices(block["choices"])
	if block.has("trigger"):
		if block["trigger"] == "ENDCODE":
			baselayer.hide()
			dialogue = 2
		elif block["trigger"] == "ODINFIGHT":
			baselayer.hide()
			get_tree().change_scene_to_file("res://scenes/odinfight.tscn")

		elif block["trigger"] == "BADEND2":
			baselayer.hide()
			get_tree().change_scene_to_file("res://scenes/badend4.tscn")
func _ready() -> void:
	jsonsrc = "res://Dialogue/dialogue 2.json"
	get_json(jsonsrc)
	load_block(currentblock)
func next():
	currentblock = nextblock
	load_block(currentblock)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		next()


func _on_canvas_layer_3_nextid(id: String) -> void:
	nextblock = scenescript[id]
	next()
	choicelayer.hide()
