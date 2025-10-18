extends Node3D

func _ready() -> void:
	pass
	
func alert ():
	%ChatBubble.visible = true
	%ChatBubble.text = "???"

func aggro ():
	%ChatBubble.visible = true
	%ChatBubble.text = "!!!"
