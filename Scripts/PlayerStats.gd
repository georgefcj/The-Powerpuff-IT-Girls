extends Node

var score = 0
var children = 0
var initial_position

func increment_score():
	self.score += 1 

func decrement_score():
	self.score -= 1 	

func increment_children():
	self.children += 1 

func get_score():
	return self.score

func get_children():
	return self.children

func set_initial_position(position):
	self.initial_position = position

func get_initial_position():
	return self.initial_position
