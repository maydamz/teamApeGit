extends Node3D

@onready var npc_path: Path3D = $"../npcPath"

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn() -> void:
	position.x = randf_range(-2.72, -1.29)
	npc_path.instantiate()
	
