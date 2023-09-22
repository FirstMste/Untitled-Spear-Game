extends Label



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Jump"):
		self.show()
	elif Input.is_action_just_released("Jump"):
		self.hide()
