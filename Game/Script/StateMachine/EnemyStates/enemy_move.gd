extends State

@onready var navigation_agent_2d:NavigationAgent2D = $"../../NavigationAgent2D"
@onready var player_pos_update_timer: Timer = $"../../PlayerPosUpdateTimer"

var direction: Vector2
var speed = 50

func Enter():
	super.Enter()
	player_pos_update_timer.start()
	navigation_agent_2d.debug_enabled = character.showDebugVisual

func Update():
	super.Update()
	character.UpdateAnmation()
	
func UpdatePhysics(delta: float):
	super.UpdatePhysics(delta)
	direction = character.global_position.direction_to(navigation_agent_2d.get_next_path_position())
	
	if !navigation_agent_2d.is_target_reached():
		character.velocity = character.velocity.lerp(direction * speed, delta)
		character.move_and_slide()

func Exit():
	player_pos_update_timer.stop()

func _on_player_pos_update_timer_timeout() -> void:
	navigation_agent_2d.target_position = character.player.global_position


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	if parentStateMachine.currentState == self && !navigation_agent_2d.is_target_reached():
		character.velocity += safe_velocity * get_physics_process_delta_time()
