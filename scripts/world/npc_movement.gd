extends AnimatedSprite3D

@export var speed: float = 4
var base_sprite:int
var sprite_type:Array = ["a","s","t"]
var sprite_variant:String
var sprite:String

func _ready() -> void:
	base_sprite = randi_range(0,5)
	sprite = str(base_sprite) + str(sprite_type[randi_range(0,2)])
	play(sprite)
	print(sprite)
	if sprite_variant.contains("t"):
		speed -=2
	elif sprite_variant.contains("a"):
		speed +=2
	pass
func _physics_process(delta):
	var path_follow = get_parent() as PathFollow3D
	var root_parent = path_follow.get_parent() as Path3D
	#path_follow.loop = false
	
	#if path_follow:
	path_follow.progress += speed * delta
	global_position = path_follow.global_position
	if is_equal_approx(1.0, path_follow.progress_ratio):
		root_parent.queue_free()
