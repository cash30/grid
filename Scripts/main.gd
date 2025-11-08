extends Node

var didStart = false
var isSnakeGenerated = false

var oldData : Array = []
var snakeData : Array = []
var snake : Array = []

var startingPos = Vector2(16, 16)
var up = Vector2(0, -1)
var down = Vector2(0, 1)
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var mmoveDirection : Vector2
var canMove : bool

var gameStarted : bool = false
var didLose : bool = false
var cells = 32
var cellSize = 10

var applePos : Vector2
var makeNewApple : bool = true

@export var apple : PackedScene = load("res://Scenes/apple.tscn")
@export var snakeScene : PackedScene = load("res://Scenes/player/player.tscn")
@export var loseScene : PackedScene = load("res://Scenes/lose.tscn")
@export var mainScene : PackedScene = load("res://Scenes/Main.tscn")
@export var score : int
var appleInst = apple.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	newGame()
	add_child(appleInst)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if didLose:
		lose()

	
func newGame() -> void:
	didLose = false
	score = 0
	mmoveDirection = up
	canMove = true
	generateSnake()
	newApple()
	#get_tree().change_scene_to_packed(null)
	
func generateSnake() -> void:
	oldData.clear()
	snakeData.clear()
	snake.clear()
	for i in range(3):
		addSegment(startingPos + Vector2(0, i))
		print("adding to snake :D. ", i + 1)
	isSnakeGenerated = true

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
		#didLose = true
		lose()

func checkIfAppleEaton():
	if snakeData[0] == applePos:
		print("nom")
		score += 1
		addSegment(oldData[-1])
		newApple()
	
func checkIfSelfCollide():
	for i in range(1, len(snakeData)):
		if snakeData[0] == snakeData[i]:
			print("ate self")
			lose()
			#end_game()
			
func newApple():
	#print("Snake:", Main.snakeData[0], "Apple:", applePos)
	while makeNewApple:
		makeNewApple = false
		applePos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		print("apple pos: ", applePos)

	if appleInst:
		appleInst.position = (applePos* cellSize)+ Vector2(0, cellSize)
		print(appleInst.position)
		makeNewApple = true
	else:
		print("apple node can not be found") #this prints but the code works so im not touching it..

func lose():
	print("loser!")
	canMove = false
	didLose = true
	
