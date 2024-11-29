extends Node

# contains the logic for which block will be sent next, the possible blocks to be selected, etc...

var i_block: PackedScene = preload("res://Blocks/i_block.tscn")
var j_block: PackedScene = preload("res://Blocks/j_block.tscn")
var l_block: PackedScene = preload("res://Blocks/l_block.tscn")
var o_block: PackedScene = preload("res://Blocks/o_block.tscn")
var s_block: PackedScene = preload("res://Blocks/s_block.tscn")
var t_block: PackedScene = preload("res://Blocks/t_block.tscn")
var z_block: PackedScene = preload("res://Blocks/z_block.tscn")

var blocks: Array = [i_block, j_block, l_block, o_block, s_block, t_block, z_block]

var available_blocks: Array = blocks.duplicate()


#choose a block from the available blocks, remove that block from available blocks
func select_block() -> PackedScene:
	var block: PackedScene
	if (available_blocks.size() > 0):
		var index = randi() % available_blocks.size()
		block = available_blocks[index]
		available_blocks.pop_at(index)
	else:
		available_blocks = blocks.duplicate()
		var index = randi() % available_blocks.size()
		block = available_blocks[index]
		available_blocks.pop_at(index)
	return block
