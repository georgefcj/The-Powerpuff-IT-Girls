extends Node2D


func _ready() -> void:
	PlayerStats.set_initial_position($Mary.position)
	
func _process(delta):
	if PlayerStats.get_score() == 1:
		$Mary/Score.text = "Você achou mais um PC!"
		
	if PlayerStats.get_score() == 2:
		$Mary/Score.text = "Você achou mais um PC!"
		
	if PlayerStats.get_score() == 3:
		$Mary/Score.text = "Você achou mais um PC!"
		
	if PlayerStats.get_score() == 4:
		$Mary/Score.text = "Você achou mais um PC!"
		

func _on_OutTheMap_body_entered(body: Node) -> void:
	if body.name == "Mary":
		$Mary.position = PlayerStats.get_initial_position()

func _on_Flag_body_entered(body: Node) -> void:
	if body.name == "Mary":
		
		if PlayerStats.get_children() == 4:
			$Mary/Score.text = "E50"
			#ADD MENU
			get_tree().change_scene("res://Scenes/Level2.tscn")
		

