# Physical note object script

# Note object setup:
# Node3D (Rename to NoteObject)
# |- MeshInstance3D
# |- Area3D
#	 |- CollisionShape3D

extends Node3D

@export var note_ui: CanvasLayer
@export var interact_label: Label

var player_near := false

func _ready():
	$Area3D.body_entered.connect(_on_body_entered)
	$Area3D.body_exited.connect(_on_body_exited)
	interact_label.hide()

func _process(delta):
	if player_near and Input.is_action_just_pressed("interact"):
		interact_label.show()
		print("DEBUG: Opening note...")
		note_ui.open_note()

func _on_body_entered(body):
	print("DEBUG: ", body.name, " entered note object.")
	if body.is_in_group("player"):
		interact_label.show()
		player_near = true
		print("DEBUG: Player near!")

func _on_body_exited(body):
	print("DEBUG: ", body.name, " exited note object.")
	if body.is_in_group("player"):
		interact_label.hide()
		player_near = false
