extends BaseCharacter

const SPPED = 150
const ACCELERATE = 5


func _unhandled_input(event: InputEvent) -> void:
	inputDirection = Input.get_vector("Left","Right","Up","Down")

func _physics_process(delta: float) -> void:
	pass
		
