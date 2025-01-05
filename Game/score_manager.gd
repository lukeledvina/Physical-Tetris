extends Node2D

func check_for_clears():
	for row in self.get_children():
		if row.counter >= 10:
			clear_line()
			print("clear line")
			row.counter = 0
			

func clear_line():
	pass
