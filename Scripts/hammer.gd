extends Area2D


func _on_body_entered(body):
	(body as Player).hammer_fetched()
	queue_free()
