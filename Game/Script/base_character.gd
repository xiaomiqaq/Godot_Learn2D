extends CharacterBody2D
class_name BaseCharacter

@export var maxHealth = 100
@onready var currentHealth = maxHealth:
	set(value):
		currentHealth = clamp(value, 0, maxHealth)
		if currentHealth == 0:
			isDead = true
@export var attackDamage = 50
var isDead = false

var knockBackDirection: Vector2
var inputDirection: Vector2 = Vector2.ZERO
var facingDirection: String = "Down"
@onready var animateSprite2D: AnimatedSprite2D = $AnimatedSprite2D
var animationToPlay: String
@onready var stateMachine: StateMachine = $StateMachine

@export var showDebugVisual: bool

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
		else:
			facingDirection = "Left"
	return facingDirection

func UpdateAnmation():
	animateSprite2D.play(stateMachine.currentState.name + "_" + GetDirectionName())

func GetHit(damage: int, fromPoint = Vector2.ZERO):
	if isDead:
		return
	currentHealth -= damage
	knockBackDirection = (global_position - fromPoint).normalized()
	
	StartBlink()
	if isDead:
		stateMachine.SwitchTo("Die")
	else:
		stateMachine.SwitchTo("Hurt")

func UpdateBlink(newValue: float):
	animateSprite2D.set_instance_shader_parameter("Blink", newValue)

func StartBlink():
	var blink_tween = get_tree().create_tween()
	blink_tween.tween_method(UpdateBlink, 1.0, 0.0, 0.3)
