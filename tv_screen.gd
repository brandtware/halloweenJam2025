extends MeshInstance3D

var time_passed : float

func _ready():
	var mat := StandardMaterial3D.new()
	mat.albedo_texture = $SubViewport.get_texture()
	set_surface_override_material(0, mat)

func _process(delta: float) -> void:
	time_passed += delta
	#print_debug(time_passed)
	var activeCam: int = time_passed/3
	if (activeCam % 2 == 1):
		$SubViewport/CameraView1.make_current()
	else:
		$SubViewport/CameraView2.make_current()
	#$SubViewport/CameraView1.rotation_degrees += Vector3 (0.0, 0.0, 10.0) * delta
