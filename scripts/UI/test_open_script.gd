#how to use script
extends Node3D
#first allow urself to call from the control node
@onready var _dialogue : Control = $"../dialogueContainer"

#then do _dialogue.display_line("DIALOGUE TEXT HERE", "speaker")
#the "speaker" parameter just changes the color of the text, and can be:
# "You" (which is the default), "Cora" (light yellow text), or "Stranger" (golden text) 
# or also "" (for certain inspects)
func _ready() -> void:
	_dialogue.display_line("It lies there, waiting to be retrieved", "")
	await _dialogue.interactPress
	_dialogue.display_line("[font_size=20]Ulol[/font_size]", "You")
	await _dialogue.interactPress
	_dialogue.close()
#check https://docs.godotengine.org/en/latest/tutorials/ui/bbcode_in_richtextlabel.html
#for more formatting options (like color, bold, italic, etc)

#to close the dialogue, do _dialogue.close() (this makes the dialogue text invisible)
