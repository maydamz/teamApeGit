extends Sprite2D

const SHADER_OUTLINE_VAR = "outline_width" 
@export var max_thickness: float = 2.0 
@export var target_scale_multiplier: float = 2.0
@export var screen_height_ratio: float = 1.1 # of screen height

@onready var sfx_inspect: AudioStreamPlayer = $AudioStreamPlayer
@onready var sfx_close: AudioStreamPlayer = $AudioStreamPlayer2

var is_inspecting: bool = false
var is_hovered: bool = false

@onready var original_position: Vector2 = global_position
@onready var original_scale: Vector2 = scale

func _ready() -> void:
	if material:
		material.set_shader_parameter(SHADER_OUTLINE_VAR, 0.0)
	
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.is_echo():
		if event.keycode == KEY_E:
			toggle_inspect()

func _on_area_2d_mouse_entered() -> void:
	is_hovered = true
	if material and not is_inspecting:
		material.set_shader_parameter(SHADER_OUTLINE_VAR, max_thickness)

func _on_area_2d_mouse_exited() -> void:
	is_hovered = false
	if material:
		material.set_shader_parameter(SHADER_OUTLINE_VAR, 0.0)

func toggle_inspect() -> void:
	is_inspecting = !is_inspecting
	
	var tween = create_tween().set_parallel(true)
	tween.set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	
	if is_inspecting:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

		if sfx_inspect:
			sfx_inspect.play()

		if material:
			material.set_shader_parameter(SHADER_OUTLINE_VAR, 0.0)
		
		var viewport_size: Vector2 = get_viewport_rect().size
		var screen_center: Vector2 = viewport_size / 2
		
		var desired_screen_height: float = viewport_size.y * screen_height_ratio
		var raw_texture_height: float = texture.get_size().y
		
		var absolute_target_scale_factor: float = desired_screen_height / raw_texture_height
		var target_scale: Vector2 = Vector2(absolute_target_scale_factor, absolute_target_scale_factor)
		
		tween.tween_property(self, "global_position", screen_center, 0.6)
		tween.tween_property(self, "scale", target_scale, 0.6)
		tween.tween_property(self, "rotation", deg_to_rad(-4), 0.5)
	else:
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

		if sfx_close:
			sfx_close.play()

		tween.tween_property(self, "global_position", original_position, 0.5)
		tween.tween_property(self, "scale", original_scale, 0.5)
		tween.tween_property(self, "rotation", 0.0, 0.5)
		
		if is_hovered and material:
			material.set_shader_parameter(SHADER_OUTLINE_VAR, max_thickness)

func get_node_of_type_area2d() -> Area2D:
	if get_parent() is Area2D:
		return get_parent()
	for child in get_children():
		if child is Area2D:
			return child
	return null
