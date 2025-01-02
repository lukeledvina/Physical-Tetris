extends Node2D
# game.gd manages all of the components under it, connecting them accordingly.

# a block spawner component will need to spawn blocks and put them as children of
# the PlayerController.
# A signal will need to be sent to the PlayerController to know to grab control of the new block

# Use this script to connect the functionality of child components. Don't have it be full of a ton of different functionality

# take the block that gets pushed into block container selected by block selector,
# allow playercontroller to see and control it

@onready var player_controller = $PlayerController
@onready var block_spawner = $BlockSpawner
@onready var block_selector = $BlockSelector
@onready var block_container = $BlockContainer
@onready var reaction_manager = $ReactionManager

func _ready() -> void:
	spawn_next_block()
	player_controller.connect("block_placed", _on_block_placed)

func spawn_next_block():
	# call functions on child nodes
	var block_scene: PackedScene
	var block_instance: CharacterBody2D
	block_scene = block_selector.select_block()
	block_instance = block_spawner.spawn_block(block_scene, $BlockContainer/SpawnPosition.global_position)
	block_container.add_child(block_instance)
	block_instance.global_position.x -= block_instance.get_child(3).position.x
	block_instance.global_position.y -= block_instance.get_child(3).position.y
	player_controller.current_block = block_instance
	
func _on_block_placed():
	spawn_next_block()
