extends Label
var score = 1


func _process(_delta: float) -> void:
	if Main != null:
		score = Main.score
		text = str(score)
	
	else:
		print("Cant find main scene")
	#print("updating score")
