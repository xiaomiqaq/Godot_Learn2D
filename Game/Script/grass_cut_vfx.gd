extends AnimatedSprite2D


func _process(delta: float) -> void:
	if frame_progress == 1:
		queue_free()  #释放
