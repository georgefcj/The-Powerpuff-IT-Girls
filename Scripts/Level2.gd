extends Node2D

func _ready() -> void:
	PlayerStats.set_score(0)
	PlayerStats.set_initial_position($Player.position)
	self.update_bugs_count()
	
func _physics_process(delta:float) -> void:
	self.update_bugs_count()
	self.update_text()

var messages = {
	1:'Conquistou seu Ph.D. em matemática na Universidade de Yale e foi professora na Faculdade Vassar',
	2:'Desenvolveu a implementação de padrões de teste para sistemas de computadores e componentes, principalmente para as linguagens de programação FORTRAN e COBOL',
	3:'Trabalhou como diretora do Grupo de Linguagens de Programação da Marinha no Escritório de Planejamento de Sistemas de Informações da Marinha',
	4:'Foi almirante e, analista de sistemas da Marinha dos Estados Unidos nas décadas de 1940 e 1950',
	5:'Criadora da linguagem de programação de alto nível Flow-Matic (atualmente em desuso)',
	6:'Também conhecida como a Rainha da Computação, A Rainha da Codificação, Almirante Grace, Vovó COBOL e a Grande Dama do Software',
	7:'A frase mais perigosa é "Sempre fizemos assim"',
	8:'Se é uma boa ideia, vá em frente e faça porque é muito mais fácil pedir desculpas do que obter permissão',
	9:'Observou que teriam que fazer um “debug” (remover o inseto) do computador. A expressão pegou, tornando-se um termo comum no campo da ciência da computação',
	10:'Foi a 2ª mulher a ser homenageada com um navio, o USS Hopper, um destroyer lança-misseis comissionado em 1997 e ainda em atividade'
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
	var can_proceed = BugStats.get_bugs_founded() == BugStats.get_total_bugs()
	if body.name == "Player" and can_proceed:
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
		queue_free()
	elif body.name == "Player" and not can_proceed:
		self.messages[PlayerStats.get_score()] = "Colete todos os BUGs"

func _on_AreaEnemy_body_entered(body):
	if body.name == "Player":
		$AudioStreamPlayer2.play()
		$Player.position = PlayerStats.get_initial_position()
