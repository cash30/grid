extends Node2D

var color = "yellow"
var isInverted = false

var colorNum = randi_range(1, 3)
var shapeNum = randi_range(1, 5)
var inverted = randi_range(1, 2)
var shape = "L" # can be "T" "line", "short T", "tall T", "S"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if colorNum == 1:
		color = "yellow"
	elif colorNum == 2:
		color = "red"
	elif colorNum == 3:
		color = "green"
	else:
		print("something is broken in piece.gd")
	
	if inverted == 1:
		isInverted = true
	elif isInverted == 2:
		isInverted = false

		color = "green"

	if shapeNum == 1:
		shape = "L"



func getColor() -> String:
	return color
	
func getIsInverted() -> bool:
	return isInverted
