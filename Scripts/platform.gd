extends RigidBody2D

class_name Platform

@onready var collision_shape_2d = $CollisionShape2D

@export var can_be_disabled = false

func disable_collision():
	if !can_be_disabled:
		return
	collision_shape_2d.disabled = true
	
func enable_collision():
	if !can_be_disabled:
		return
	
	collision_shape_2d.disabled = false
