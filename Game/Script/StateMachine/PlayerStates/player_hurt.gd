extends State

func Enter():
	super.Enter()
	character.UpdateAnmation()


func UpdatePhysics(delta: float):
	super.UpdatePhysics(delta)
	
	if parentStateMachine.animate_sprite_2d.frame_progress == 1:
		parentStateMachine.SwitchTo("Idle")
	if character.animateSprite2D.frame == 0:
		character.move_and_collide(character.knockBackDirection * delta * 200)
	
