extends Node2D

func _ready() -> void:
	PlayerStats.set_initial_position($Player.position)
	self.update_bugs_count()
	
func _process(delta:float) -> void:
	self.update_bugs_count()
	self.update_text()

var messages = {
	1:'Conquistou seu Ph.D. em matemática na Universidade de Yale e foi professora na Faculdade Vassar',
	2:'Desenvolveu a implementação de padrões de teste para sistemas de computadores e componentes, principalmente para as linguagens de programação FORTRAN e COBOL',
	3:'Trabalhou como diretora do Grupo de Linguagens de Programação da Marinha no Escritório de Planejamento de Sistemas de Informações da Marinha',
	4:'Foi almirante e, analista de sistemas da Marinha dos Estados Unidos nas décadas de 1940 e 1950',
	5: 'Criadora da linguagem de programação de alto nível Flow-Matic (atualmente em desuso)'
}

func update_bugs_count() -> void:
	$Player/BugStatus.text = BugStats.bugs_count()

func update_text() -> void:
	var score = PlayerStats.get_score()
	if score > 0 and score  <= messages.size():
		$Player/Text.text = messages[score]

func _on_OutTheMap_body_entered(body):
	if body.name == "Player":
		$Player.position = PlayerStats.get_initial_position()

func _on_Flag_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/Level3.tscn")

