extends Control

@onready var _dialogue : RichTextLabel = $dialogueTextContainer/dialogueText
@onready var _speaker : RichTextLabel = $speakerName
@onready var _indicator: Label = $indicator
@onready var _animator: AnimationPlayer = $indicator/transparencyController

signal interactPress

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		interactPress.emit()
		
func display_line(line : String, type = "You"):
	_animator.stop()
	_indicator.modulate.a = 0
	#if line.length() >= 10:
		#_dialogue.textSpeed = 0.5
	if type == "You":
		_dialogue.text = line
		_speaker.text = "You"
	if type == "Cora":
		_dialogue.text = "[color=Khaki]" + line + "[/color]"
		_speaker.text = "[color=Khaki]Cora[/color]"
	if type == "Stranger":
		_dialogue.text = "[color=Gold]" + line + "[/color]"
		_speaker.text = "[color=Gold]Stranger[/color]"
	if type == "":
		_dialogue.text = "[font_size=14][color=Gainsboro]" + line + "[/color][/font_size]"
		_speaker.text = ""
	_dialogue._ready()
	open()
	await _dialogue.tween.finished
	_animator.play("reveal")
	await _animator.animation_finished
	_animator.play("blinking")
	
func open():
	visible = true
	
func close():
	visible = false
	
