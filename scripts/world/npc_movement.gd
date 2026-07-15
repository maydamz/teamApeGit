extends CharacterBody3D

@export var speed: float = 150.0

func _npc_walk(delta):
	var path_follow = get_parent() as PathFollow3D
	
	if path_follow:
		path_follow.progress += speed * delta
		global_position = path_follow.global_position
