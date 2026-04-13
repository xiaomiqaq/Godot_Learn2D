extends State

func Enter():
	super.Enter()
	character.UpdateAnmation()

func Update():
	super.Update()

func UpdatePhysics(delta: float):
	super.UpdatePhysics(delta)
	
	if character.animateSprite2D.frame == 0:
		character.move_and_collide(character.knockBackDirection * delta * 50)
	
