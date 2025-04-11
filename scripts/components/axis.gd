@tool
class_name Axis extends MeshInstance3D

@export var a: Node3D = null
@export var b: Node3D = null

func _init() -> void:
	# process after regular physical objects
	process_physics_priority = 1
	mesh = CylinderMesh.new()
	mesh.top_radius = 0.03
	mesh.bottom_radius = 0.03

func _physics_process(_delta: float) -> void:
	if a and b and mesh is CylinderMesh:
		var cylinder := mesh as CylinderMesh
		var pos_a := a.global_position
		var pos_b := b.global_position
		var direction := pos_a.direction_to(pos_b)
		cylinder.height = pos_a.distance_to(pos_b)
		global_position = (pos_a + pos_b) / 2.0
		global_transform.basis = _look_at(direction)

func _look_at(direction: Vector3) -> Basis:
	var helper := Vector3.FORWARD if direction.angle_to(Vector3.UP) == 0.0 else Vector3.UP
	var y := direction
	var x := y.cross(helper)
	var z := y.cross(x)
	return Basis(x, y, z)
