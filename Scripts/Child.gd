extends Area2D

func _on_Coin_body_entered(body: Node) -> void:
	if body.name == "Mary":
		
		if PlayerStats.get_score() == 4 :
			if PlayerStats.get_children() <= 3:
				PlayerStats.increment_children()
			
				$AudioStreamPlayer.play()
				$AnimatedSprite.play("received")
			
				yield ($AudioStreamPlayer, "finished")
		queue_free()
