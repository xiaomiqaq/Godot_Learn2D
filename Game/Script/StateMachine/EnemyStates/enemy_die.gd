extends State


func Enter():
	super.Enter()
	character.UpdateAnmation()
	character.animateSprite2D.offset.y -= 10.0
	
func Update():
	super.Update()
	if character.animateSprite2D.frame_progress == 1:
		character.queue_free()
