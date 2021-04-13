extends Area2D

func _on_Bug_body_entered(body:Node) -> void:
	if body.name == "Player":
		BugStats.found_bug()
		if visible:
			visible = false
		queue_free()
