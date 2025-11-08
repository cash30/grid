extends Label
var score = 1

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	var score = Main.score
	text = "score: " + str(score)
	if Main != null:
		#print(Main.score)
		print(Main)
	else:
		print("Cant find main scene")
	#print("updating score")
