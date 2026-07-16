# Player script

# Player setup:
# CharacterBody3D
# |- MeshInstance3D (rename to Player)
# |- CollisionShape3D
# |- Node3D (rename to Head)
#	 |- Camera3D

# Input mapping:
# move_forward: W (physical)
# move_left: A (physical)
# move_right: S (physical)
# move_backward: D (physical)
# sprint: Shift (physical)

extends CharacterBody3D

# Movement variables
var speed
var sprint_enabled = false # Sprint is disabled by default
const WALK_SPEED = 4.5
const SPRINT_SPEED = 7.0

# Camera bob variables
const SENSITIVITY = 0.001
const BOB_FREQ = 2.0
const BOB_AMP = 0.08
var t_bob = 0.0

# FOV control variables
var base_fov = 75.0
const FOV_CHANGE = 1.0

# Step / slope assistance
const FLOOR_SNAP = 0.35

# Accessing head and camera as variables
@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera3D

var camera_rest_position: Vector3

# Locks mouse to the window center
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	add_to_group("player")

	# Step / curb assistance
	floor_snap_length = FLOOR_SNAP
	safe_margin = 0.05
	floor_max_angle = deg_to_rad(55.0)

	# Helps maintain constant speed on slopes
	floor_constant_speed = true

	camera_rest_position = camera.position

# First person camera controls
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Sprint
	if sprint_enabled == true and Input.is_action_pressed("sprint"):
		print("DEBUG: Sprinting...")
		speed = SPRINT_SPEED
	else:
		speed = WALK_SPEED

	# Directional movement controls
	var input_dir := Input.get_vector(
		"move_left",
		"move_right",
		"move_forward",
		"move_backward"
	)

	var direction := (
		head.transform.basis *
		Vector3(input_dir.x, 0, input_dir.y)
	).normalized()

	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = lerp(velocity.x, 0.0, delta * 7.0)
		velocity.z = lerp(velocity.z, 0.0, delta * 7.0)

	# Collision handling with other bodies
	move_and_slide()

	# Enable head bobbing
	var horizontal_speed = Vector2(velocity.x, velocity.z).length()
	t_bob += delta * horizontal_speed * float(is_on_floor())
	camera.position = camera_rest_position + _headbob(t_bob)

	# FOV effects
	var velocity_clamped = clamp(
		horizontal_speed,
		0.5,
		SPRINT_SPEED * 2
	)

	var target_fov = base_fov + FOV_CHANGE * velocity_clamped
	camera.fov = lerp(camera.fov, target_fov, delta * 8.0)

# Head bobbing
func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2.0) * BOB_AMP
	return pos
