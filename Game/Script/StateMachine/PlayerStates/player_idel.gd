extends State

func UpdatePhysics(delta: float):
	super.UpdatePhysics(delta)

		

func Update():
	super.Update()
	character.UpdateAnmation()
	if character.inputDirection.length() > 0:
		parentStateMachine.SwitchTo("Run")
		return
	if Input.is_action_just_pressed("Attack"):
		parentStateMachine.SwitchTo("Attack")
func Enter():
	pass
	
func Exit():
	pass

func Ready():
	pass
