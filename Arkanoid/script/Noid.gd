extends Node

var level = 0
var levels = [
	"res://Levels/Level1.tscn",
	"res://Levels/Level2.tscn",
	"res://Levels/Level3.tscn",
	"res://Levels/Leve4.tscn",
	"res://Levels/LevelFinal.tscn"
];
var activeLevelNode = null

func _ready():
	nextLevel()
	pass

func nextLevel():
	$Ball.resetPosition()
	var currentLevel = load(levels[level])
	activeLevelNode = currentLevel.instance()
	add_child(activeLevelNode)

func _process(delta):
	if activeLevelNode.get_children().size() == 0:
		level += 1
		nextLevel()
