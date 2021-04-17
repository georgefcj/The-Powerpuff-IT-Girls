extends Area2D

func _on_Bug_body_entered(body:Node) -> void:
	if body.name == "Player" and visible:
		visible = false	
		BugStats.found_bug()
		PlayerStats.increment_score()
		$AudioStreamPlayer.play()
		yield($AudioStreamPlayer, "finished")	
		queue_free()


func _physics_process(delta):
	$AnimatedSprite.play("flying");
