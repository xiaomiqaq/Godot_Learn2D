extends State

func UpdatePhysics(delta: float):
	super.UpdatePhysics(delta)
	if character.inputDirection.length() > 0:
		parentStateMachine.SwitchTo("Run")
		

func Update():
	super.Update()
	character.UpdateAnmation()
	
func Enter():
	pass
	
func Exit():
	pass

func Ready():
	pass
