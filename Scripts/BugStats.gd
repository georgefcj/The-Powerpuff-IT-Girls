extends Node

var total_bugs = 5
var bugs_founded = 0

func found_bug():
	self.bugs_founded += 1

func bugs_count():
	return str(self.bugs_founded) + "/"+ str(self.total_bugs)
