extends CharacterBody2D

@onready var south_container: Node2D = $RayCastContainer/SouthRayCastContainer
@onready var north_container: Node2D = $RayCastContainer/NorthRayCastContainer
@onready var east_container: Node2D = $RayCastContainer/EastRayCastContainer
@onready var west_container: Node2D = $RayCastContainer/WestRayCastContainer

# Initialize raycast arrays
@onready var south_raycasts: Array = []
@onready var north_raycasts: Array = []
@onready var east_raycasts: Array = []
@onready var west_raycasts: Array = []

# Indices for rotation
var down_index: int = 2
var right_index: int = 1
var left_index: int = 3

var ray_cast_container_array: Array = []

# Active raycast containers
var down_ray_cast_container: Array
var right_ray_cast_container: Array
var left_ray_cast_container: Array

var rotating_cw: bool = false
var rotating_ccw: bool = false

func _ready():
	# Populate raycast arrays
	south_raycasts = south_container.get_children()
	north_raycasts = north_container.get_children()
	east_raycasts = east_container.get_children()
	west_raycasts = west_container.get_children()

	# Initialize raycast container array
	ray_cast_container_array = [north_raycasts, east_raycasts, south_raycasts, west_raycasts]

	# Set initial active containers
	update_ray_cast_containers()

# Update raycast containers after rotation
func update_ray_cast_containers():
	down_ray_cast_container = ray_cast_container_array[down_index]
	right_ray_cast_container = ray_cast_container_array[right_index]
	left_ray_cast_container = ray_cast_container_array[left_index]

# Rotate clockwise
func rotate_clockwise():
	rotating_cw = true
	rotation_degrees += 90
	down_index = (down_index - 1) % 4
	right_index = (right_index - 1) % 4
	left_index = (left_index - 1) % 4
	update_ray_cast_containers()
	await get_tree().create_timer(0.05).timeout
	rotating_cw = false

# Rotate counter-clockwise
func rotate_counter_clockwise():
	rotating_ccw = true
	rotation_degrees -= 90
	down_index = (down_index + 1) % 4
	right_index = (right_index + 1) % 4
	left_index = (left_index + 1) % 4
	update_ray_cast_containers()
	await get_tree().create_timer(0.05).timeout
	rotating_ccw = false

# Collision checking functions
func can_move_down() -> bool:
	for raycast in down_ray_cast_container:
		if raycast.is_colliding():
			return false
	return true

func can_move_right() -> bool:
	for raycast in right_ray_cast_container:
		if raycast.is_colliding():
			return false
	return true

func can_move_left() -> bool:
	for raycast in left_ray_cast_container:
		if raycast.is_colliding():
			return false
	return true

# this sometimes works if it only goes one block into the area, breaks if block rotates two blocks out of bounds in one rotation
# set up a node of individual collision boxes , multiply shift by how many collide on rotation
# check raycasts each time on opposing side and stop shifting if they detect a collision

# shit does not work
func _on_rotation_safety_area_body_entered(_body):
	if rotating_ccw:
		self.global_position.x += 32
	elif rotating_cw:
		self.global_position.x -= 32
