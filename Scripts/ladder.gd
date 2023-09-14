extends Area2D

const BASE_REGION_SIZE = 8

@export var length:float = 2
@export var can_barrel_go_down = false
@export var barrel_goes_down_chance = 0.5
@export var ladder_top_length: float = 6

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D


func _ready():
	sprite_2d.region_rect = Rect2(0, BASE_REGION_SIZE * length, BASE_REGION_SIZE, BASE_REGION_SIZE * length)
		
	collision_shape_2d.shape = RectangleShape2D.new()
	collision_shape_2d.shape.set_size(Vector2(0.025, length * BASE_REGION_SIZE + ladder_top_length))
	collision_shape_2d.position.y = -ladder_top_length



func _on_body_entered(body):
	if body is Player:
		(body as Player).start_climbing(position.x)
	
	if body is Barrel && can_barrel_go_down && randf() < barrel_goes_down_chance:
		(body as Barrel).fall_down_the_ladder()


func _on_body_exited(body):
	if body is Player:
		(body as Player).stop_climbing()
