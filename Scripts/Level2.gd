extends Node2D

const Winner = preload("res://Scenes/Winner.tscn")
var venceu = Winner.instance()

func _ready() -> void:
	$ColorRect.visible = false
	
func _process(delta: float) -> void:
	$Player/Score.text = "Score: " + str(PlayerStats.get_score()) 


func _on_OutTheMap_body_entered(body: Node) -> void:
	if body.name == "Player":
		$Player.position = PlayerStats.get_initial_position()


func _on_Flag_body_entered(body: Node) -> void:
	if body.name == "Player":
		print("Você ganhou!")
		$ColorRect.visible = true
		$ColorRect.add_child(venceu)


func _on_AreaEnemy_body_entered(body: Node) -> void:
	if body.name == "Player":
		$Player.position = PlayerStats.get_initial_position()


func _on_AreaEnemy2_body_entered(body: Node) -> void:
	if body.name == "Player":
		$Player.position = PlayerStats.get_initial_position()
