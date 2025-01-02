extends Node

# controls the block that is the child of this node, able to move left and right,
# drop quickly and rotate

# logic to remove the block as child and reparent it under block container will
# either be under this script or part of the block script

signal block_placed()

# implement a getter/setter, so that when it is set to something new, code runs
@export var current_block: CharacterBody2D:
	set(block):
		current_block = block
		active = true
		$BlockFallTimer.start()


var active: bool = false
var can_move: bool = true


# block raycasts left and right need to determine if the block can move left or right
# current_block.can_move_right() / .can_move_left()
func _process(_delta: float) -> void:
	if active and can_move:
		if Input.is_action_pressed("move_left") and current_block.can_move_left():
			current_block.global_position.x -= 32
		elif Input.is_action_pressed("move_right") and current_block.can_move_right():
			current_block.global_position.x += 32
		elif Input.is_action_pressed("rotate_clockwise"):
			current_block.rotate_clockwise()
		elif Input.is_action_pressed("rotate_counter_clockwise"):
			current_block.rotate_counter_clockwise()
		can_move = false
		$MovementCooldownTimer.start()


# check to see if block's rays pointing "down" collide with anything
# if they do, signal to the game to give a new block and lose control of the current one (active = false)
# if they don't drop the block's position by 32px
func _on_block_fall_timer_timeout() -> void:
	if current_block.can_move_down():
		current_block.global_position.y += 32
	else:
		active = false
		$BlockPlacementTimer.start()


func _on_movement_cooldown_timer_timeout() -> void:
	can_move = true


func _on_block_placement_timer_timeout() -> void:
	block_placed.emit()
