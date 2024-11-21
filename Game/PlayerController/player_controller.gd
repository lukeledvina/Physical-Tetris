extends Node

# controls the block that is the child of this node, able to move left and right,
# drop quickly and rotate

# logic to remove the block as child and reparent it under block container will
# either be under this script or part of the block script



# implement a getter/setter, so that when it is set to something new, code runs
@export var current_block: StaticBody2D
