extends Control

@onready var _dialogue : RichTextLabel = $dialogueTextContainer/dialogueText

func display_line(line : String, type = "mc"):
	if type == "mc":
		_dialogue.text = line
	if type == "friend":
		_dialogue.text = "[color=Khaki]" + line + "[/color]"
	if type == "npc":
		_dialogue.text = "[color=Gold]" + line + "[/color]"
	_dialogue._ready()
	open()

func open():
	visible = true
	
func close():
	visible = false
	
