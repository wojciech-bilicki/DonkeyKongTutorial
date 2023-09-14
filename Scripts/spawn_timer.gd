extends Timer

class_name SpawnTimer

@export var min_time: float = 2
@export var max_time: float = 5

func _ready():
	setup()
	
func setup():
	var timeout_time = randf_range(min_time, max_time)
	self.wait_time = timeout_time
	start()
