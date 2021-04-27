extends Node2D


func _ready() -> void:
	PlayerStats.set_initial_position($Mary.position)
	
func _process(delta):
	$Mary/ScoreStatus.text = PlayerStats.score_count_mary()
	
	if PlayerStats.get_score() == 1:
		$Mary/Score.text = "Mary Lou Jepsen é \n executiva técnica e inventora nas \n áreas de display, imagem e hardware de computador."
		
	if PlayerStats.get_score() == 2:
		$Mary/Score.text = "Suas contribuições tiveram adoção \n mundial em displays, HDTV, \n laptops e projetores."
		
	if PlayerStats.get_score() == 3:
		$Mary/Score.text = "Ela foi a força técnica por trás \n da geração de computação de \n baixo custo e tecnologias \n inovadoras de imagem médica e de consumo"
		
	if PlayerStats.get_score() == 4:
		$Mary/Score.text = "Ela foi nomeada uma das cem pessoas \n mais influentes do mundo pela \n Time Magazine, foi nomeada em 2013 como \n um dos dez maiores pensadores da \n CNN em ciência e tecnologia por seu \n trabalho em inovação de display, e ela tem mais de \n 200 patentes publicadas ou emitidas."
		

func _on_OutTheMap_body_entered(body: Node) -> void:
	if body.name == "Mary":
		$Mary.position = PlayerStats.get_initial_position()

func _on_Flag_body_entered(body: Node) -> void:
	if body.name == "Mary":
		
		if PlayerStats.get_children() == 4:
			get_tree().change_scene("res://Scenes/MainMenu.tscn")
			queue_free()

