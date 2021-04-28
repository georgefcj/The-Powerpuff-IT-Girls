extends Node2D


func _ready() -> void:
	PlayerStats.set_score(0)
	PlayerStats.set_children(10)
	PlayerStats.set_initial_position($Mary.position)
	
func _process(delta):
	$Mary/ScoreStatus.text = PlayerStats.score_count_mary()
	
	if PlayerStats.get_children() == 9:
		$Mary/Score.text = "Mary Lou Jepsen é executiva técnica e inventora nas áreas de display, imagem e hardware de computador."
		
	if PlayerStats.get_children() == 8:
		$Mary/Score.text = "Suas contribuições tiveram adoção mundial em displays, HDTV, laptops e projetores."
		
	if PlayerStats.get_children() == 7:
		$Mary/Score.text = "Ela foi a co-fundadora e primeira diretora de tecnologia da One Laptop per Child (OLPC)"
		
	if PlayerStats.get_children() == 6:
		$Mary/Score.text = "Formada em Studio Art e Engenharia Elétrica pela Universidade Brown. Mestre em Holografia pela MIT Media Lab. Doutora em Ciências Opticas pela Universidade Brown."
		
	if PlayerStats.get_children() == 5:
		$Mary/Score.text = "Ela foi a força técnica por trás da geração de computação de baixo custo e tecnologias inovadoras de imagem médica e de consumo."
		
	if PlayerStats.get_children() == 4:
		$Mary/Score.text = "Na OLPC, Jepsen inventou a tecnologia de display legível à luz do sol do laptop."
		
	if PlayerStats.get_children() == 3:
		$Mary/Score.text = "Ela foi nomeada uma das 100 pessoas mais influentes do mundo pela Time Magazine."
		
	if PlayerStats.get_children() == 2:
		$Mary/Score.text = "Responsável pela criação do sistema mundial holográfico de vídeo em 1989."
		
	if PlayerStats.get_children() == 1:
		$Mary/Score.text = "Trabalhou como conselheira e diretora de projetos na Google e executiva da realidade virtual do Facebook."
		
	if PlayerStats.get_children() == 0:
		$Mary/Score.text = "Ela foi nomeada em 2013 como um dos dez maiores pensadores da CNN em ciência e tecnologia por seu trabalho em inovação de display."
		

func _on_OutTheMap_body_entered(body: Node) -> void:
	if body.name == "Mary":
		$Mary.position = PlayerStats.get_initial_position()

func _on_Flag_body_entered(body: Node) -> void:
	var can_proceed = PlayerStats.get_children() == 0
	if body.name == "Mary" and can_proceed:
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
		queue_free()
	elif body.name == "Mary" and not can_proceed:
		$Mary/Score2.text = "Ajude todas as CRIANÇAS"

func _on_AreaEnemy_area_entered(body: Node) -> void:
	if body.name == "Area2D":
		$AudioStreamPlayer2.play()
		$Mary.position = PlayerStats.get_initial_position()
