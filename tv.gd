extends Node3D

func toggle(): 
	$TV_Screen.toggle()

@export var currentCam : Camera3D :
	get:
		return $TV_Screen.currentCam
		
@export var currentViewport : Viewport :
	get:
		return $TV_Screen.currentViewport
