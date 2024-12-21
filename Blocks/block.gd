extends StaticBody2D

@onready var south_container: Node2D = $RayCastContainer/SouthRayCastContainer
@onready var north_container: Node2D = $RayCastContainer/NorthRayCastContainer
@onready var east_container: Node2D = $RayCastContainer/EastRayCastContainer
@onready var west_container: Node2D = $RayCastContainer/WestRayCastContainer

@onready var south_raycasts: Array = south_container.get_children()
@onready var north_raycasts: Array = north_container.get_children()
@onready var east_raycasts: Array = east_container.get_children()
@onready var west_raycasts: Array = west_container.get_children()

@onready var down_ray_cast_container: Array = south_raycasts
@onready var right_ray_cast_container: Array = east_raycasts
@onready var left_ray_cast_container: Array = west_raycasts
var down_index: int = 2:
	set(index):
		if index > 3:
			down_index = 0
		elif index < 0:
			down_index = 3
		else:
			down_index = index
var right_index: int = 1:
	set(index):
		if index > 3:
			right_index = 0
		elif index < 0:
			right_index = 3
		else:
			right_index = index
var left_index: int = 3:
	set(index):
		if index > 3:
			left_index = 0
		elif index < 0:
			left_index = 3
		else:
			left_index = index

var ray_cast_container_array: Array = [north_raycasts, east_raycasts, south_raycasts, west_raycasts]

# these functions determine which ray cast will be active next
func rotate_clockwise():
	rotation_degrees += 90
	down_index -= 1
	right_index -= 1
	left_index -= 1
	down_ray_cast_container = ray_cast_container_array[down_index]
	right_ray_cast_container = ray_cast_container_array[right_index]
	left_ray_cast_container = ray_cast_container_array[left_index]

func rotate_counter_clockwise():
	rotation_degrees -= 90
	down_index += 1
	right_index += 1
	left_index += 1
	down_ray_cast_container = ray_cast_container_array[down_index]
	right_ray_cast_container = ray_cast_container_array[right_index]
	left_ray_cast_container = ray_cast_container_array[left_index]

# checks if the raycasts pointing "down" are colliding with anything
func can_move_down() -> bool: #works
	var raycasts: Array = down_ray_cast_container
	for raycast in raycasts:
		if raycast.is_colliding():
			return false
		else:
			continue
	return true
	
func can_move_right() -> bool:
	var raycasts: Array = right_ray_cast_container
	for raycast in raycasts:
		if raycast.is_colliding():
			return false
		else:
			continue
	return true
	
func can_move_left() -> bool:
	var raycasts: Array = left_ray_cast_container
	for raycast in raycasts:
		if raycast.is_colliding():
			return false
		else:
			continue
	return true

	
