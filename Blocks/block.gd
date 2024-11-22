extends StaticBody2D

@onready var south_container: Node2D = $RayCastContainer/SouthRayCastContainer
@onready var north_container: Node2D = $RayCastContainer/NorthRayCastContainer
@onready var east_container: Node2D = $RayCastContainer/EastRayCastContainer
@onready var west_container: Node2D = $RayCastContainer/WestRayCastContainer

var down_ray_cast_container: Node2D = south_container
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

var ray_cast_container_array: Array = [north_container, east_container, south_container, west_container]

# these functions determine which ray cast will be active next
func rotate_clockwise():
	down_index -= 1
	right_index -= 1
	left_index -= 1
	down_ray_cast_container = ray_cast_container_array[down_index]

func rotate_counter_clockwise():
	down_index += 1
	right_index += 1
	left_index += 1
	down_ray_cast_container = ray_cast_container_array[down_index]

# checks if the raycasts pointing "down" are colliding with anything
func check_raycast():
	pass

	
