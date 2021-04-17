extends Area2D

func _on_Bug_body_entered(body:Node) -> void:
	if body.name == "Player" and visible:	
		BugStats.found_bug()
		PlayerStats.increment_score()
		
		if visible:
			$AudioStreamPlayer.play()
			visible = false
			
		yield($AudioStreamPlayer, "finished")	
		queue_free()


func _physics_process(delta):
	$AnimatedSprite.play("flying");
