@tool

extends Sprite2D

@export var randomRegions: Array[Rect2]
var seedNum: int

func _ready() -> void:
	UpdateRandomRegion()

func UpdateRandomRegion():
	if randomRegions:
		seedNum = int(global_position.x + global_position.y)
		seed(seedNum)
		var randomIndex = randi_range(0, randomRegions.size() -1)
		region_rect = randomRegions[randomIndex]

func _enter_tree() -> void:
	set_notify_transform(true)
	
func _notification(what: int) -> void:
	if what == NOTIFICATION_TRANSFORM_CHANGED:
		if Engine.is_editor_hint():
			UpdateRandomRegion()
