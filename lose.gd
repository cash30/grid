extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if Main.didLose:
		show()
		if Input.is_action_just_pressed("click"):
			Main.newGame()
	else:
		hide()
