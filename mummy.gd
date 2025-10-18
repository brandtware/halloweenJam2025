extends Node3D
class_name Mummy

func _ready() -> void:
	pass
	
func alert ():
	%ChatBubble.showBubble("???",3)

func aggro ():
	%ChatBubble.showBubble("!!!",5)
