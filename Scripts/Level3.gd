extends Node2D


func _ready() -> void:
	PlayerStats.set_initial_position($Mary.position)
	
func _process(delta):
	$Mary/ScoreStatus.text = PlayerStats.score_count_mary()
	
	if PlayerStats.get_score() == 1:
		$Mary/Score.text = "Mary Lou Jepsen é executiva técnica e inventora nas áreas de display, imagem e hardware de computador."
		
	if PlayerStats.get_score() == 2:
		$Mary/Score.text = "Suas contribuições tiveram adoção mundial em displays, HDTV, laptops e projetores."
		
	if PlayerStats.get_score() == 3:
		$Mary/Score.text = "Ela foi a força técnica por trás da geração de computação de baixo custo e tecnologias inovadoras de imagem médica e de consumo."
		
	if PlayerStats.get_score() == 4:
		$Mary/Score.text = "Ela foi nomeada uma das cem pessoas mais influentes do mundo pela Time Magazine, foi nomeada em 2013 como um dos dez maiores pensadores da CNN em ciência e tecnologia por seu trabalho em inovação de display."
		

func _on_OutTheMap_body_entered(body: Node) -> void:
	if body.name == "Mary":
		$Mary.position = PlayerStats.get_initial_position()

func _on_Flag_body_entered(body: Node) -> void:
	if body.name == "Mary":
		
		if PlayerStats.get_children() == 4:
			get_tree().change_scene("res://Scenes/MainMenu.tscn")
			queue_free()

