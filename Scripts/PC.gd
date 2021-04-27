extends Area2D

func _on_Coin_body_entered(body: Node) -> void:
	if body.name == "Mary":
		PlayerStats.increment_score()
		
		if visible:
			$AudioStreamPlayer.play()
			visible = false
			
		yield ($AudioStreamPlayer, "finished")
		queue_free()
