extends CanvasLayer

@onready var progress_bar: ProgressBar = $Control_HUD/ProgressBar
@onready var control_game_over: Control = $Control_GameOver

func _ready() -> void:
	control_game_over.visible = false
