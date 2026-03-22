extends CharacterBody2D
class_name  BaseCharacter

var inputDirection : Vector2 = Vector2.ZERO
var facingDirection: String = "Down"
@onready var animateSprite2D:AnimatedSprite2D = $AnimatedSprite2D
var animationToPlay: String
@onready var stateMachine:StateMachine = $StateMachine

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

func UpdateAnmation():
	animateSprite2D.play(stateMachine.currentState.name + "_" + GetDirectionName())
