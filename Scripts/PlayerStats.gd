extends Node

var score = 0
var initial_position

func increment_score():
	self.score += 1 

func score_count():
	return str(get_score()) + "/"+ str(10)

func get_score():
	return self.score

func set_initial_position(position):
	self.initial_position = position

func get_initial_position():
	return self.initial_position
