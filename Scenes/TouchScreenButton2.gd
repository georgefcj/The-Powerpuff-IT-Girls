extends TouchScreenButton

export var scene= "res://Scenes/Level2.tscn"

func _on_TouchScreenButton_pressed():
	if (scene != ""):
		get_tree().change_scene(scene)
	else:
		get_tree().quit()
