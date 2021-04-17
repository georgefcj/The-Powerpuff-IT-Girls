extends Area2D

func _physics_process(delta):
	$AnimatedSprite.play("moving");
