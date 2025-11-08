extends Label
var score = 0
var highScore = 0
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	score = Main.score
	if score > highScore and Main.didLose:
		highScore = score
	text = str(highScore)
