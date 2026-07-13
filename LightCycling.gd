extends Node3D

@export var light_source:DirectionalLight3D
@export var skybox:WorldEnvironment
@export var day_length:float
@export var light_str_day:float
@export var light_str_night:float
@export var sky_color_day:Color
@export var sky_color_night:Color
var time:float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#skybox.environment.background_color = sky_color_day
	light_source.light_energy = light_str_day
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#timer of the day
	time += delta
	var time_conv = fmod(time, day_length)
	var cycle = time_conv/day_length
	#converts the timer to 0.0-1.0
	print(str(cycle))
	light_source.rotation.x = cycle * PI * 2.0 #it rotates in a circle so uhh if it works
	
	if cycle>0.5:
		light_source.light_energy = lerp(light_source.light_energy, light_str_day, 1-cycle)#it seems to work
		#skybox.environment.background_color = sky_color_day
	else:
		light_source.light_energy = lerp(light_source.light_energy, light_str_night,1-cycle * 2)
		#skybox.environment.background_color = sky_color_night
	pass
