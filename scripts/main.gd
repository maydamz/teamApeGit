extends Node
@onready var day_night_sys = $DayNightSystem
@onready var _spawner1: Node3D = $spawner1
@onready var _spawner2: Node3D = $spawner2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_spawner1.spawn()
	_spawner2.spawn()
	day_night_sys.changeTime("Morning")
	await get_tree().create_timer(10).timeout
	day_night_sys.changeTime("Midday")
	await get_tree().create_timer(10).timeout
	day_night_sys.changeTime("Sunset")
	await get_tree().create_timer(10).timeout
	day_night_sys.changeTime("Night")
	await get_tree().create_timer(10).timeout
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	#const moveSpeed := 4.0
	#$npcPath/npcFollowedPath.progress += moveSpeed * delta
	pass
