extends CharacterBody2D

var rock_in_ranged = false

const speed = 100
var current_dir = "no"
@onready var steps = $steps
@onready var breakage = $breakage


func _ready():
	$AnimatedSprite2D.play("no_walk")
	$AnimatedSprite2D.flip_h = true

func _physics_process(delta):
	player_movement(delta)
	break_rock()
	
	
	
func player_movement(delta):
	steps.is_playing() == false
	var stepping = false
	if Input.is_action_pressed("Romper"):
		$AnimatedSprite2D.play("break", 1.0, true)
	elif Input.is_action_pressed("Arriba"):
		stepping = true
		play_anim(1)
		current_dir = "up"
		velocity.x = 0
		velocity.y = -speed
	elif Input.is_action_pressed("Abajo"):
		stepping = true
		play_anim(1)
		current_dir = "down"
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("Izquierda"):
		stepping = true
		play_anim(1)
		current_dir = "left"
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("Derecha"):
		stepping = true
		play_anim(1)
		current_dir = "right"
		velocity.x = speed
		velocity.y = 0
	else:
		play_anim(0)
		stepping = false
		velocity.x = 0
		velocity.y = 0
	if stepping == true:
		if steps.is_playing() == false:
			steps.play()
	
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	if dir == "no":
		anim.play("no_walk")
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
			
func break_rock():
	if  Input.is_action_pressed("Romper") and rock_in_ranged:
		breakage.play()
		global.score += 1
		global.minerals.text = str(global.score)
		global.player_breaking = true
	else:
		global.player_breaking = false
		
		
func player():
	pass

func _on_area_2d_body_entered(body):
	if body.has_method("rock"):
		rock_in_ranged = true
		global.rockid = body.get_name()


func _on_area_2d_body_exited(body):
	if body.has_method("rock"):
		rock_in_ranged = false
		global.rockid = "-1"
