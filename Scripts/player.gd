extends CharacterBody2D


var isOnTilex : bool = int(position.x) % 10 != 0
var isOnTiley : bool = int(position.y) % 10 != 0
var shouldGoUp : bool = int(position.x) % 10 > 5
var shouldGoDown : bool = int(position.x) % 10 < 5


@export var speed : int = 100.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	moveSnake()
	
	
	
	
	move_and_slide()
	
func moveSnake():
	if Main.canMove:
		
		if Input.is_action_pressed("up") and !Input.is_action_pressed("down"):
			Main.mmoveDirection = Main.up
			Main.canMove = false
			if !Main.gameStarted:
				startGame()
		if Input.is_action_pressed("down") and !Input.is_action_pressed("up"):
			Main.mmoveDirection = Main.down
			Main.canMove = false
			if !Main.gameStarted:
				startGame()
		if Input.is_action_pressed("left") and !Input.is_action_pressed("right"):
			Main.mmoveDirection = Main.left
			Main.canMove = false
			if !Main.gameStarted:
				startGame()
		if Input.is_action_pressed("right") and !Input.is_action_pressed("left"):
			Main.mmoveDirection = Main.right
			Main.canMove = false
			if !Main.gameStarted:
				startGame()
	
	
func startGame():
	Main.gameStarted = true
	$Timer.start()


func _on_timer_timeout() -> void:
	pass # Replace with function body.



	#isOnTilex = int(position.x) % 10 == 0
	#isOnTiley = int(position.y) % 10 == 0
	#print(int(position.y) % 10)
		#
	#if !isOnTilex and !isOnTiley:
		#if shouldGoUp:
			#position.x -= 1
		#elif shouldGoDown:
			#position.x += 1
		#position.y += 1
