extends Node
class_name StateMachine


var currentState: State

func _ready() -> void:
	for child in get_children():
		var childState = child as State
		childState.parentStateMachine = self
		childState.Ready()
	currentState = get_child(0)
	currentState.Enter()
	
		
