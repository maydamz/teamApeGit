extends Node
@onready var day_night_sys = $DayNightSystem
@onready var npc_scene = preload("res://scenes/spawned_npc.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#test call for day night system
	spawnNpc()
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

func spawnNpc():
	var follow_node = PathFollow3D.new()
	$npcPath.add_child(follow_node)
	
	var new_npc = npc_scene.instantiate()
	
	follow_node.add_child(new_npc)
