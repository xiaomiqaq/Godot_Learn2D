extends Node
class_name State

var parentStateMachine: StateMachine
var character: BaseCharacter

@warning_ignore("unused_parameter")
func UpdatePhysics(delta: float):
	pass

func Update():
	if parentStateMachine.debug_label:
		parentStateMachine.debug_label.text = name
func Enter():
	pass
	
func Exit():
	pass

func Ready():
	pass
