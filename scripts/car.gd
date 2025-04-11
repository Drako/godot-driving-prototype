class_name Car extends VehicleBody3D

@export_range(0.0, PI/2.0, 0.1) var max_steering: float = 0.8

const INPUT_STEER_LEFT: StringName = &"steer_left"
const INPUT_STEER_RIGHT: StringName = &"steer_right"

func _process(delta: float) -> void:
	steering = move_toward(
		steering,
		Input.get_axis(INPUT_STEER_RIGHT, INPUT_STEER_LEFT) * max_steering,
		delta * 2.5
	)
	engine_force = move_toward(
		engine_force,
		Input.get_action_strength(&"accelerate") * 500.0,
		delta * 100.0
	)
	brake = move_toward(
		brake,
		Input.get_action_strength(&"brake") * 300.0,
		delta * 50.0
	)
