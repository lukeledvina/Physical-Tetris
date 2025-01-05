extends Node2D

var counter: int = 0

func _on_area_2d_body_entered(_body):
	counter += 1
