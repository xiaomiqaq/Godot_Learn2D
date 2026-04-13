extends State

var facingDirection: String
var attackCollisionShape: CollisionShape2D
@onready var attack_hit_box: Area2D = $"../../AttackHitBox"
const  VFX_SLASH = preload("res://Game/Scene/vfx_slash.tscn")

func Ready():
	super.Ready()
	for child in attack_hit_box.get_children():
		var childCollisionShape = child as CollisionShape2D
		if childCollisionShape:
			childCollisionShape.disabled = true

func Enter():
	super.Enter()
	character.UpdateAnmation()

	facingDirection = character.facingDirection
	var collisionShapeNode = attack_hit_box.get_node("CollisionShape2D_" + facingDirection)
	if collisionShapeNode:
		attackCollisionShape = collisionShapeNode

func Update():
	super.Update()
	if attackCollisionShape == null:
		parentStateMachine.SwitchTo("Idle")
		return

	if parentStateMachine.animate_sprite_2d.frame == 2:
		attackCollisionShape.disabled = false
	elif parentStateMachine.animate_sprite_2d.frame == 5:
		attackCollisionShape.disabled = true

	if parentStateMachine.animate_sprite_2d.is_playing() == false:
		parentStateMachine.SwitchTo("Idle")

func Exit():
	super.Exit()
	if attackCollisionShape:
		attackCollisionShape.disabled = true

func _on_attack_hit_box_area_entered(area: Area2D) -> void:
	var grassNode = area as Grass
	if grassNode:
		grassNode.GetCut()
	
	var enemyNode = area.get_parent() as EnemyCharacter
	if enemyNode:
		area.get_parent().GetHit(character.attackDamage, character.global_position)
		if	enemyNode.isDead == false:
			SpawnSlashVFX(enemyNode.global_position)
		
func SpawnSlashVFX(pos: Vector2):
	var newVFX = VFX_SLASH.instantiate() as Node2D
	newVFX.global_position = pos + Vector2(0, -25)
	get_tree().root.add_child(newVFX)
