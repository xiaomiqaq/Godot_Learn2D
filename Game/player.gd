extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var inputDirection : Vector2 = Vector2.ZERO
const SPPED = 150
const ACCELERATE = 5
var facingDirection: String = "Down"
@onready var animateSprite2D = $AnimatedSprite2D
var animationToPlay: String

func _physics_process(delta: float) -> void:
	inputDirection = Input.get_vector("Left","Right","Up","Down")
	velocity = velocity.lerp(inputDirection * SPEED, ACCELERATE * delta)
	
	move_and_slide()
	if velocity.length() > 20:
		animationToPlay = "Run_" + GetDirectionName()
	else :
		animationToPlay = "Idle_" + GetDirectionName()
	animateSprite2D.play(animationToPlay)
		

func GetDirectionName() -> String:
	if inputDirection == Vector2.ZERO:
		return facingDirection
	
	if inputDirection.y < 0:
		facingDirection = "Up"
	elif inputDirection.y > 0:
		facingDirection = "Down"
	else:
		if inputDirection.x > 0:
			facingDirection = "Right"
		else :
			facingDirection = "Left"
	return facingDirection
