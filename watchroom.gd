extends Node3D

func _ready() -> void:
	Dialogic.signal_event.connect(dialogicSignal)
	Dialogic.start("0_intro")
	Globals.activeTv = $Moebel/TV_Level1

func dialogicSignal (arg:String):
	if arg == "show_ui":
		$Room.activate(true)
		%AnimationPlayer.play("zoom_lvl1")
	elif arg == "ZoomOut1":
		$TV_UI.visible = false
		%AnimationPlayer.play_backwards("zoom_lvl1")
		Dialogic.start("2_intro")
		$Room.activate(false)
	elif arg == "zoom_lvl2":
		%AnimationPlayer.play("zoom_lvl2")
	elif arg == "activateUI":
		$TV_UI.visible = true
		
