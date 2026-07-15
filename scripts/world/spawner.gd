extends Node3D

@onready var npc_scene = preload("res://scenes/npc_path.tscn")
@onready var npc_path: Path3D = $"../npcPath"
#var npcscript = preload("res://scripts/world/npc_movement.gd")

func _ready() -> void:

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn() -> void:
	#position.x = randf_range(-2.72, -1.29)
	var npc = npc_scene.instantiate()
	npc.global_position.x = randf_range(-2.72, -1.8)
	add_child(npc)
