extends TileMapLayer

const GRASS = preload("uid://ccjjqlu381onj")
const OFFSET = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enabled = false
	
	var cellArray = get_used_cells()
	for cellCoordinate in cellArray:
		var newGrass = GRASS.instantiate()
		newGrass.global_position = global_position + cellCoordinate * 32.0 + Vector2(16,16)
		get_parent().add_child.call_deferred(newGrass)
		
		var randomOffser = Vector2(randf_range(-OFFSET, OFFSET), randf_range(-OFFSET, OFFSET))
		newGrass.global_position += randomOffser
		
		newGrass.get_node("Sprite2D").flip_h = randi_range(0, 1)
		newGrass.get_node("Sprite2D_Back").flip_h = randi_range(0, 1)
		
