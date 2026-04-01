extends CanvasLayer

@export var bgroup: ButtonGroup
var diac: Dictionary
signal  nextid(id: String)

func _ready() -> void:
	bgroup.pressed.connect(get_choice)

func set_choices(choices: Dictionary):
	diac = choices
	var index = 0
	var buttons = bgroup.get_buttons()
	for c in choices.keys():
		buttons[index].text = c
		index += 1



func get_choice(b: Button):
	var id = diac[b.text]
	nextid.emit(id)
