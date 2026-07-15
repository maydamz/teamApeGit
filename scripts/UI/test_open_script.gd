#how to use script
extends Node3D
#first allow urself to call from the control node
@onready var _dialogue : Control = $"../dialogueContainer"

#then do _dialogue.display_line("DIALOGUE TEXT HERE", "speaker")
#the "speaker" parameter just changes the color of the text, and can be:
# "mc" (which is the default), "friend" (light yellow text), or "npc" (golden text) 
func _ready() -> void:
	_dialogue.display_line("[wave]this also supports special formatting[/wave]", "friend")
	await _dialogue.interactPress
	_dialogue.display_line("i guess bro")
	await _dialogue.interactPress
	_dialogue.close()
#check https://docs.godotengine.org/en/latest/tutorials/ui/bbcode_in_richtextlabel.html
#for more formatting options (like color, bold, italic, etc)

#to close the dialogue, do _dialogue.close() (this makes the dialogue text invisible)
