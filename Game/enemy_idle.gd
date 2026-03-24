extends State

var playerDetectionRadius = 100
@onready var polygon2D: Polygon2D = $"../../Polygon2D"

func Enter():
	super.Enter()
	if character.showDebugVisual:
		CreatePolygonCircle()
	else:
		polygon2D.polygon = PackedVector2Array()

func Update():
	super.Update()
	character.UpdateAnmation()
	
	if character.global_position.distance_to(character.player.global_position) <= playerDetectionRadius:
		parentStateMachine.SwitchTo("Move")

func Exit():
	super.Exit()
	polygon2D.polygon = PackedVector2Array()  #置空

func CreatePolygonCircle():
	var points = PackedVector2Array()
	
	for i in 36:
		var angle = deg_to_rad(i * 10)
		var point2D = Vector2(cos(angle), sin(angle)) * playerDetectionRadius
		points.append(point2D)
		
	polygon2D.polygon = points
