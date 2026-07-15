extends Control

@onready var _dialogue : RichTextLabel = $dialogueTextContainer/dialogueText
@onready var _speaker : RichTextLabel = $speakerName
@onready var _indicator: Label = $indicator
@onready var _animator: AnimationPlayer = $indicator/transparencyController

signal interactPress

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		interactPress.emit()
		
func display_line(line : String, type = "mc"):
	_animator.stop()
	_indicator.modulate.a = 0
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
	await _dialogue.tween.finished
	_animator.play("reveal")
	await _animator.animation_finished
	_animator.play("blinking")

func open():
	visible = true
	
func close():
	visible = false
	
