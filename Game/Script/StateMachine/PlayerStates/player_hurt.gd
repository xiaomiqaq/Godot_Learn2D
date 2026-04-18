extends State

func Enter():
	super.Enter()
	character.UpdateAnmation()
	
	character.isInvincible = true
	character.UpdateInvincibleEffect(true)
	await  get_tree().create_timer(2).timeout
	character.isInvincible = false
	character.UpdateInvincibleEffect(false)

func UpdatePhysics(delta: float):
	super.UpdatePhysics(delta)
	
	if parentStateMachine.animate_sprite_2d.frame_progress == 1:
		parentStateMachine.SwitchTo("Idle")
	if character.animateSprite2D.frame == 0:
		character.move_and_collide(character.knockBackDirection * delta * 200)
	
