extends CharacterBody2D

func _physics_process(delta):
	if global.player_breaking and self.name == global.rockid:
		self.queue_free()

func rock ():
	pass

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		global.player_breaking = false
		global.rockid = "-1"
