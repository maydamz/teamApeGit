extends Sprite3D

@export var speed: float = 30.0

func _ready() -> void:
	speed -= randi_range(-5, 5)

func _physics_process(delta):
	var path_follow = get_parent() as PathFollow3D
	var root_parent = path_follow.get_parent() as Path3D
	path_follow.loop = false
	
	if path_follow:
		path_follow.progress += speed * delta
		global_position = path_follow.global_position
	if is_equal_approx(1.0, path_follow.progress_ratio):
		root_parent.queue_free()
