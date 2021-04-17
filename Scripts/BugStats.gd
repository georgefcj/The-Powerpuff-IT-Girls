extends Node

var total_bugs = 5
var bugs_founded = 0

func found_bug():
	self.bugs_founded += 1

func bugs_count():
	return str(self.get_bugs_founded()) + "/"+ str(self.get_total_bugs())
	
func get_total_bugs():
	return self.total_bugs
	
func get_bugs_founded():
	return self.bugs_founded
