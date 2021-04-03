extends Node2D


func _ready() -> void:
	PlayerStats.set_initial_position($Player.position)
	
func _process(delta):
	#$Player/Score.text = "Score: " + str(PlayerStats.get_score()) 
	if PlayerStats.get_score() == 1:
		$Player/Score.text = "Winifred Mitchell Baker é a presidente executiva e CEO da Fundação Mozilla e da Mozilla Corporation."
		
	if PlayerStats.get_score() == 2:
		$Player/Score.text = "Firefox se tornou uma das aplicações de código livre mais usadas por usuários domésticos."
		
	if PlayerStats.get_score() == 3:
		$Player/Score.text = "Mitchell Baker é formada em Direito pela Universidade da Califórnia."
		
	if PlayerStats.get_score() == 4:
		$Player/Score.text = "O projeto Mozilla também ajudou a popularizar o código aberto no mundo comercial."
		
	if PlayerStats.get_score() == 5:
		$Player/Score.text = "Em novembro de 1994, Baker foi contratada como uma das primeiras funcionárias do departamento jurídico da Netscape Communications Corporation."
		
	if PlayerStats.get_score() == 6:
		$Player/Score.text = "O Firefox 1.0 foi lançado em 2004 e tornou-se um grande sucesso — em menos de um ano, foi baixado mais de 100 milhões de vezes."
		
	if PlayerStats.get_score() == 7:
		$Player/Score.text = "Mitchell continua seu compromisso com uma Web aberta e inovadora e com as possibilidades infinitas que ela apresenta."
		
	if PlayerStats.get_score() == 8:
		$Player/Score.text = "Cerca de 40% do código do Mozilla Firefox foi totalmente escrito por voluntários."
		
	if PlayerStats.get_score() == 9:
		$Player/Score.text = "Em 2009, Baker recebeu o Prêmio Mulheres com Visão de Liderança do Instituto Anita Borg."
		
	if PlayerStats.get_score() == 10:
		$Player/Score.text = "Mitchell escreveu a missões da Mozilla: a Licença Pública da Mozilla em 1998, o Manifesto da Mozilla em 2007 e o Adendo ao Manifesto da Mozilla - também conhecido como Compromisso por uma Internet Saudável - em 2018."
		


func _on_OutTheMap_body_entered(body: Node) -> void:
	if body.name == "Player":
		$Player.position = PlayerStats.get_initial_position()


func _on_AreaEnemy_body_entered(body: Node) -> void:
	if body.name == "Player":
		$AudioStreamPlayer2.play()
		$Player.position = PlayerStats.get_initial_position()


func _on_Flag_body_entered(body: Node) -> void:
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/Level2.tscn")
		
