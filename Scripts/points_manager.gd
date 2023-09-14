extends Node

class_name PointsManager

@onready var player = $"../Player" as Player
@onready var points_label_scene = preload("res://Scenes/points_label.tscn")
@onready var ui = $"../UI" as UI
@export var points_increment = 100


const POINTS_LABEL_OFFSET = Vector2(0, -25)

var points = 0

func _ready():
	player.award_points.connect(on_award_points)
	
func on_award_points(position: Vector2):
	var label = points_label_scene.instantiate()
	add_child(label)
	label.position = position + POINTS_LABEL_OFFSET
	label.text = "%d" % points_increment
	points += points_increment
	ui.set_points(points)
	

