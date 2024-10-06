extends CharacterBody2D

const speed = 100
var current_dir = "no"

func _ready():
	$AnimatedSprite2D.play("no_walk")
	$AnimatedSprite2D.flip_h = true

func _physics_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	if Input.is_action_pressed("Arriba"):
		play_anim(1)
		current_dir = "up"
		velocity.x = 0
		velocity.y = -speed
	elif Input.is_action_pressed("Abajo"):
		play_anim(1)
		current_dir = "down"
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("Izquierda"):
		play_anim(1)
		current_dir = "left"
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("Derecha"):
		play_anim(1)
		current_dir = "right"
		velocity.x = speed
		velocity.y = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = true
		if movement == 1:
			anim.play("walk")
		elif movement == 0:
			anim.play("no_walk")
	if dir == "left":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk")
		elif movement == 0:
			anim.play("no_walk")
	if dir == "up":
		if movement == 1:
			anim.play("walk")
		elif movement == 0:
			anim.play("no_walk")
	if dir == "down":
		if movement == 1:
			anim.play("walk")
		elif movement == 0:
			anim.play("no_walk")
