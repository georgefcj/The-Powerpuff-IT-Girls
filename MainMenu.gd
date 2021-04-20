
extends MarginContainer

var timer

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.wait_time = 0.001


#CENA 1
const first_scene = preload("res://Scenes/Level1.tscn")

##CENA 2
#const second_scene = preload("res://Scenes/Level2.tscn")
##CENA 3
#const second_scene = preload("res://Scenes/Level3.tscn")

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selector_tree = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector

var current_selection = 0


func _ready ():
	set_current_selection(0)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_right")and current_selection < 2:
		$SelectorSound.play()
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_left") and current_selection > 0:
		$SelectorSound.play()
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		$ConfirmSound.play()
		yield(get_tree().create_timer(0.5), "timeout")
		handle_selection(current_selection)
		
func handle_selection(_current_selection):
	# CENA 1
	if _current_selection == 0:
		get_parent().add_child(first_scene.instance())
		queue_free()
#	# CENA 2
#	if _current_selection == 1:
#		get_parent().add_child(second_scene.instance())
#		queue_free()
#	# CENA 3
#	if _current_selection == 2:
#		get_parent().add_child(third_scene.instance())
#		queue_free()

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_tree.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
	elif _current_selection == 2:
		selector_tree.text = ">"
		
