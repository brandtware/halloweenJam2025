extends Node3D

func _ready() -> void:
	%Mummy.visible = false

func _process(delta: float) -> void:
	$Path3D/PathFollow3D.progress_ratio += 0.05 * delta

func activate() -> void:
	%Mummy.visible = true


func _on_punch_area_body_entered(body: Node3D) -> void:
	print (body)
	if (body is Mummy):
		%Tom.isReadyToPunch(true)


func _on_punch_area_body_exited(body: Node3D) -> void:
	print (body)
	if (body is Mummy):
		%Tom.isReadyToPunch(false)
