extends Control

@onready var _dialogue : RichTextLabel = $dialogueTextContainer/dialogueText
@onready var _speaker : RichTextLabel = $speakerName

func display_line(line : String, type = "mc"):
	if type == "mc":
		_dialogue.text = line
		_speaker.text = "You"
	if type == "friend":
		_dialogue.text = "[color=Khaki]" + line + "[/color]"
		_speaker.text = "[color=Khaki]Cora[/color]"
	if type == "npc":
		_dialogue.text = "[color=Gold]" + line + "[/color]"
		_speaker.text = "[color=Gold]Stranger[/color]"
	_dialogue._ready()
	open()

func open():
	visible = true
	
func close():
	visible = false
	
