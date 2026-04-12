extends Node
class_name State

var parentStateMachine: StateMachine
var character: BaseCharacter

@warning_ignore("unused_parameter")
func UpdatePhysics(delta: float):
	pass

func Update():
	if parentStateMachine.debug_label:
		if character.showDebugVisual:
			parentStateMachine.debug_label.text = name + '/' + str(character.currentHealth)
		else:
			parentStateMachine.debug_label.visible = false
func Enter():
	pass
	
func Exit():
	pass

func Ready():
	pass
