extends StaticBody2D

@onready var south_container: Node2D = $RayCastContainer/SouthRayCastContainer
@onready var north_container: Node2D = $RayCastContainer/NorthRayCastContainer
@onready var east_container: Node2D = $RayCastContainer/EastRayCastContainer
@onready var west_container: Node2D = $RayCastContainer/WestRayCastContainer

var active_ray_cast_container: Node2D = south_container
var rotation_index: int = 2
var ray_cast_container_array: Array = [north_container, east_container, south_container, west_container]

# these functions determine which ray cast will be active next
func rotate_clockwise():
	rotation_index += 1
	if rotation_index > 3:
		rotation_index = 0
	active_ray_cast_container = ray_cast_container_array[rotation_index]

func rotate_counter_clockwise():
	rotation_index -= 1
	if rotation_index < 0:
		rotation_index = 3
	active_ray_cast_container = ray_cast_container_array[rotation_index]

# checks if the raycasts pointing "down" are colliding with anything
func check_raycast():
	pass
