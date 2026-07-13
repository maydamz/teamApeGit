#how to use script
extends Node3D
#first allow urself to call from the control node
@onready var _dialogue : Control = $uiLayer/dialogueContainer

#then do _dialogue.display_line("DIALOGUE TEXT HERE")
func _ready() -> void:
	_dialogue.display_line("[wave]this also supports special formatting[/wave]")
	await get_tree().create_timer(3.0).timeout
	_dialogue.close()
#check https://docs.godotengine.org/en/latest/tutorials/ui/bbcode_in_richtextlabel.html
#for more formatting options (like color, bold, italic, etc)

#to close the dialogue, do _dialogue.close() (makes the dialogue text invisible)
