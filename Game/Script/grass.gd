extends Area2D

var scaleTween: Tween
var startScale:Vector2 = Vector2(1.0,1.0)
var endScale:Vector2 = Vector2(1.0, 0.5)

var skewTween: Tween
var skewTweenBack: Tween
@onready var sprite2DBack:Sprite2D = $Sprite2D_Back
@onready var sprite2D:Sprite2D = $Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var startSkew = deg_to_rad(randf_range(-10, 10))
	var endSkew = -startSkew
	
	skewTween = get_tree().create_tween().set_loops();
	skewTween.tween_property(sprite2D, "skew", endSkew, 1.5).from(startSkew)
	skewTween.tween_property(sprite2D, "skew", startSkew, 1.5).from(endSkew)
	skewTween.set_ease(Tween.EASE_IN)
	skewTween.set_speed_scale(randf_range(0.5, 1.5))
	var startSkewBack = endSkew * 0.5;
	var endSkewBack = -startSkewBack
	
	skewTweenBack = get_tree().create_tween().set_loops();
	skewTweenBack.tween_property(sprite2D, "skew", endSkewBack, 1.5).from(startSkewBack)
	skewTweenBack.tween_property(sprite2D, "skew", startSkewBack, 1.5).from(endSkewBack)
	skewTweenBack.set_ease(Tween.EASE_IN)
	


@warning_ignore("unused_parameter")
func _on_body_entered(body: Node2D) -> void:
	CrateNewScaleTween(endScale, 0.1)
	
func _on_body_exited(body: Node2D) -> void:
	CrateNewScaleTween(startScale, 0.5)


func CrateNewScaleTween(targetVal: Vector2, duration: float ):
	if scaleTween:
		scaleTween.kill()
	scaleTween = get_tree().create_tween()
	scaleTween.tween_property(sprite2D, "scale", targetVal, duration)
	scaleTween.set_ease(Tween.EASE_OUT)
