extends Node

# take the block scene, instantiate it
func spawn_block(block_scene: PackedScene, block_position: Vector2) -> CharacterBody2D:
	var block_instance: CharacterBody2D = block_scene.instantiate()
	block_instance.global_position = block_position
	return block_instance
