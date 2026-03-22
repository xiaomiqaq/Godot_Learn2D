extends Node
class_name StateMachine


var currentState: State
@onready var debug_label: Label = $"../DebugLabel"

func _ready() -> void:
	for child in get_children():
		var childState = child as State
		childState.parentStateMachine = self
		childState.character = get_parent()
		childState.Ready()
	currentState = get_child(0)
	currentState.Enter()
	
	
func _physics_process(delta: float) -> void:
	currentState.UpdatePhysics(delta)
	
func _process(delta: float) -> void:
	currentState.Update()
	
func SwitchTo(targetState: String):
	var nextState = get_node(targetState)
	
	if !nextState:
		print("切换状态节点失败，无法找到节点：", targetState)
		return
		
	currentState.Exit()
	currentState = nextState
	currentState.Enter()
		
