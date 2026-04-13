extends State


func Enter():
	super.Enter()
	character.UpdateAnmation()
	character.animateSprite2D.offset.y -= 10.0
	
func Update():
	super.Update()
	if character.animateSprite2D.frame_progress == 1:
		character.queue_free()

func UpdatePhysics(delta: float):
	super.UpdatePhysics(delta)
	
	if character.animateSprite2D.frame == 0:
		character.move_and_collide(character.knockBackDirection * delta * 100)
	
