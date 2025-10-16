extends Node3D

func _ready() -> void:
	Dialogic.signal_event.connect(dialogicSignal)
	Dialogic.start("0_intro")

func dialogicSignal (arg:String):
	if arg == "show_ui":
		$TV_UI.visible = true
		$Camera3D.position = Vector3 (2.024, 2.905, 1.199)
		$Camera3D.rotation = Vector3.ZERO
