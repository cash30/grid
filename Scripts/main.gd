extends Node2D


var oldData : Array
var snakeData : Array
var snake : Array

var startingPos = Vector2(16, 16)
var up = Vector2(0, -1)
var down = Vector2(0, 1)
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var mmoveDirection : Vector2
var canMove : bool

var gameStarted = false
var cells = 32
var cellSize = 10

@export var snakeScene : PackedScene
@export var score : int =  0
@export var speed : int = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	newGame()

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	
func newGame() -> void:
	score = 0
	mmoveDirection = right
	canMove = true
	generateSnake()
	
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
