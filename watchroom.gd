extends Node3D

func _ready():
	var mat := StandardMaterial3D.new()
	mat.albedo_texture = $Mesh3D/SubViewport.get_texture()
	$Mesh3D.set_surface_override_material(0, mat)
	

func _process(delta: float) -> void:
	$Mesh3D/SubViewport/Camera3D2.rotation_degrees += Vector3 (0.0, 0.0, 10.0) * delta
