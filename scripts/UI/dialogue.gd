extends Control

@onready var _dialogue : RichTextLabel = $dialogueTextContainer/dialogueText

func display_line(line : String):
	_dialogue.text = line
	_dialogue._ready()
	open()

func open():
	visible = true
	
func close():
	visible = false
	
