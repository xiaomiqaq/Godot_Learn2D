extends State

var facingDirection: String
var attackCollisionShape: CollisionShape2D
@onready var attack_hit_box:Area2D = $"../../AttackHitBox"

func Ready():
	super.Ready() 
	#遍历hit_box下的所有碰撞检测区域
	for child in attack_hit_box.get_children():
		var childCollisionShape = child as CollisionShape2D
		if childCollisionShape:
			childCollisionShape.disabled = true

func Enter():
	super.Enter()
	character.UpdateAnmation()
	
	facingDirection = character.facingDirection
	var collisionShape_node = attack_hit_box.get_node("CollisionShape2D_" + facingDirection)
	if collisionShape_node:
		attackCollisionShape = collisionShape_node
		print(attackCollisionShape)

func Update():
	super.Update()
	#让攻击判定区域在第二帧到第5帧生效
	if parentStateMachine.animate_sprite_2d.frame == 2:
		attackCollisionShape.disabled = false
	elif parentStateMachine.animate_sprite_2d.frame == 5:
		attackCollisionShape.disabled = true
		
		
	#结束
	if parentStateMachine.animate_sprite_2d.is_playing() == false:
		parentStateMachine.SwitchTo("Idle")

func Exit():
	super.Exit()
	attackCollisionShape.disabled = true


func _on_attack_hit_box_area_entered(area: Area2D) -> void:
	#print(area.get_parent())
	area.get_parent().GetHit(character.attackDamage)
