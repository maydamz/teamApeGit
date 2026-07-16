extends CanvasLayer

@onready var note_sprite = $Sprite2D

var is_open := false

@onready var page_1: Sprite2D = $Node2D/Sprite2D
@onready var page_2: Sprite2D = $Node2D/Sprite2D2


func _ready():
	visible = false

func open_note():
	if is_open:
		return

	is_open = true
	visible = true

	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	page_1.toggle_inspect()
	page_2.toggle_inspect()

	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.set_process(false)
		player.set_physics_process(false)

func close_note():
	if not is_open:
		return

	page_1.toggle_inspect()
	page_2.toggle_inspect()

	is_open = false
	visible = false

	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.set_process(true)
		player.set_physics_process(true)

func _unhandled_input(event):
	if is_open and event.is_action_pressed("ui_cancel"):
		close_note()
