extends Node2D


var oldData : Array = []
var snakeData : Array = []
var snake : Array = []

var startingPos = Vector2(16, 16)
var up = Vector2(0, -1)
var down = Vector2(0, 1)
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var mmoveDirection : Vector2 = up
var canMove : bool

var gameStarted = false
var didLose : bool = false
var cells = 32
var cellSize = 10

var applePos = Vector2(10, 10)
var makeNewApple : bool = true

@export var snakeScene : PackedScene = load("res://Scenes/player/player.tscn")
@export var loseScene : PackedScene = load("res://Scenes/lose.tscn")
@export var mainScene : PackedScene = load("res://Scenes/Main.tscn")
@export var score : int =  50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	newGame()
	#newApple()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	
func newGame() -> void:
	score = 0
	mmoveDirection = up
	canMove = true
	generateSnake()
	newApple()
	get_tree().change_scene_to_packed(null)
	var didLose = false
func generateSnake() -> void:
	oldData.clear()
	snakeData.clear()
	snake.clear()
	for i in range(3):
		addSegment(startingPos + Vector2(0, i))

func addSegment(pos):
	snakeData.append(pos)
	var segment = snakeScene.instantiate()
	segment.position = (pos * cellSize) + Vector2(0, cellSize)
	add_child(segment)
	snake.append(segment)
	#https://www.youtube.com/watch?v=DlRP-UBR-2A working on this @4:14
	
func checkOutIfHitWall():
	if snakeData[0].x < 0 or snakeData[0].x > cells - 1 or snakeData[0].y < 0 or snakeData[0].y > cells - 1:
		print("hit wall")
		lose()
		didLose = true
	#end_game()

func checkIfAppleEaton():
	if oldData[0] == applePos:
		print("nom")
		score += 1
		addSegment(oldData[-1])
		newApple()
	
func checkIfSelfCollide():
	for i in range(1, len(snakeData)):
		if snakeData[0] == snakeData[i]:
			print("ate self")
			didLose = true
			#end_game()
			
func newApple():
	print("Snake:", Main.snakeData[0], "Apple:", applePos)
	while makeNewApple:
		makeNewApple = false
		applePos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		#for i in snakeData:
			#if applePos == i:
				#makeNewApple = true
	if $Apple != null:
		$Apple.position = (applePos* cellSize)+ Vector2(0, cellSize)
		print($Apple.position)
		#makeNewApple = true
		
	else:
		print("apple issue") #this prints but the code works so im not touching it..

func lose():
	get_tree().change_scene_to_packed(loseScene)
	canMove = false

func _on_apple_area_entered(area: Area2D) -> void:
	if area.is_in_group("head"):
		newApple()
		print("nom")
		score += 1
		#addSegment(oldData[0])
