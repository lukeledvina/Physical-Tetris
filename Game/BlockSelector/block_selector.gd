extends Node

# contains the logic for which block will be sent next, the possible blocks to be selected, etc...

var i_block: PackedScene = preload("res://Blocks/i_block.tscn")
var j_block: PackedScene
var l_block: PackedScene
var o_block: PackedScene
var s_block: PackedScene
var t_block: PackedScene
var z_block: PackedScene

var blocks: Array = [i_block, j_block, l_block, o_block, s_block, t_block, z_block]

var available_blocks: Array = blocks
