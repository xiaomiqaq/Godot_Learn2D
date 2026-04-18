extends State


func Enter():
	super.Enter()
	character.UpdateAnmation()

func UpdatePhysics(delta: float):
	if character.animateSprite2D.frame == 0:
		character.move_and_collide(character.knockBackDirection * delta * 200)
