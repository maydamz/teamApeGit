extends Control

@onready var _dialogue : RichTextLabel = $dialogueTextContainer/dialogueText
@onready var _speaker : RichTextLabel = $speakerName
@onready var _indicator: Label = $indicator
@onready var _animator: AnimationPlayer = $indicator/transparencyController

func display_line(line : String, type = "mc"):
	_indicator.visible = false
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
	_indicator.visible = true
	_animator.play("reveal")
	await _animator.animation_finished
	_animator.play("blinking")
	
func dialogue_sc1() -> void:
	display_line("ANDRO!", "friend")
	display_line("Hey, what’s up? It’s my birthday today and you didn’t even greet me..", "friend")
	display_line("Ulol")
	display_line("Haaa… You got me… But really, you didn’t even say good morning earlier.", "friend")
	display_line("You just passed by and went straight to your shop.", "friend")
	pass

func open():
	visible = true
	
func close():
	visible = false
	
