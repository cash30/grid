extends CharacterBody2D
var moveDirection = Vector2(0, 0)




#@export var speed : int = 1.0

func _ready() -> void:
	moveDirection = Main.mmoveDirection

func _process(_delta: float) -> void:
	moveDirection = Main.mmoveDirection
	moveSnake()
	#move_and_slide()
	
func moveSnake():
	if Main.canMove:
		
		if Input.is_action_pressed("up") and Main.mmoveDirection != Main.down and !Input.is_action_pressed("down"):
			Main.mmoveDirection = Main.up
			Main.canMove = false
			if !Main.gameStarted:
				startGame()
		if Input.is_action_pressed("down") and Main.mmoveDirection != Main.up and !Input.is_action_pressed("up"):
			Main.mmoveDirection = Main.down
			Main.canMove = false
			if !Main.gameStarted:
				startGame()
		if Input.is_action_pressed("left") and Main.mmoveDirection != Main.right and !Input.is_action_pressed("right"):
			Main.mmoveDirection = Main.left
			Main.canMove = false
			if !Main.gameStarted:
				startGame()
		if Input.is_action_pressed("right") and Main.mmoveDirection != Main.left and !Input.is_action_pressed("left"):
			Main.mmoveDirection = Main.right
			Main.canMove = false
			if !Main.gameStarted:
				startGame()
	
	
func startGame():
	Main.gameStarted = true
	#Main.newGame()
	$Timer.start()


func _on_timer_timeout() -> void:
	Main.canMove = true
	Main.oldData = [] + Main.snakeData
	Main.snakeData[0] += moveDirection
	for i in range(len(Main.snakeData)):
		#move all the segments along by one
		if i > 0:
			Main.snakeData[i] = Main.oldData[i - 1]
		Main.snake[i].position = (Main.snakeData[i] * Main.cellSize) + Vector2(0, Main.cellSize)

	if !Main.didLose:
		Main.checkOutIfHitWall()
		Main.checkIfAppleEaton()
		Main.checkIfSelfCollide()
		
