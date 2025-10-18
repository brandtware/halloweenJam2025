extends MeshInstance3D

var time_passed : float
var currentCam : Camera3D
@export var autoCam : bool = true

func _ready():
	var mat := StandardMaterial3D.new()
	mat.albedo_texture = $SubViewport.get_texture()
	set_surface_override_material(0, mat)
	currentCam = $SubViewport/CameraView1
	Globals.toggleCam.connect(toggle)

func _process(delta: float) -> void:
	if autoCam:
		time_passed += delta
		#print_debug(time_passed)
		var activeCam: int = time_passed/3
		if (activeCam % 2 == 1):
			$SubViewport/CameraView1.make_current()
		else:
			$SubViewport/CameraView2.make_current()
		#$SubViewport/CameraView1.rotation_degrees += Vector3 (0.0, 0.0, 10.0) * delta

func toggle(): 
	autoCam = false
	if currentCam == $SubViewport/CameraView1:
		currentCam = $SubViewport/CameraView2
	else:
		currentCam = $SubViewport/CameraView1
	currentCam.make_current()
	
@export var currentViewport : Viewport :
	get:
		return $SubViewport
