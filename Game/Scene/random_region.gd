extends Sprite2D

@export var randomRegions: Array[Rect2]


func _ready() -> void:
	UpdateRandomRegion()

func UpdateRandomRegion():
	if randomRegions:
		var randomIndex = randi_range(0, randomRegions.size() -1)
		region_rect = randomRegions[randomIndex]
