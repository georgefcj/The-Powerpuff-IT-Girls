extends KinematicBody2D

export (float) var gravity  = 15
var velocity = Vector2()
export var speed = 350
export var jump_force = 400
var number_of_jumps = 0

func _physics_process(delta):
	# Delta fixo = 0,016667
	
	if (Input.is_action_pressed("LEFT")):
		velocity.x = -speed
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("walking")
	elif (Input.is_action_pressed("RIGHT")):
		velocity.x = +speed
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("walking")
	else:
		velocity.x = 0
		$AnimatedSprite.play("idle")
	if (is_on_floor() && Input.is_action_just_pressed("JUMP")):
		$AudioStreamPlayer.play()
		velocity.y = -jump_force
		number_of_jumps = 0
		
	
	# Pulo duplo
	if (number_of_jumps < 1 && Input.is_action_just_pressed("JUMP") && not is_on_floor()):
		velocity.y = -jump_force
		number_of_jumps += 1
	
	if not is_on_floor():
		$AnimatedSprite.play("jumping")
	
		#if not Input.is_action_just_pressed("JUMP"):
		#	$AnimatedSprite.position = PlayerStats.get_initial_position()
	velocity.y += gravity
	# Permite que o player pare ao colidir com um objeto
	velocity =  move_and_slide(velocity, Vector2.UP)
	

	#PlayerStats.increment_score()
	#print("Score:", PlayerStats.get_score())
