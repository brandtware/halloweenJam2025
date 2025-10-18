extends Control

func _ready() -> void:
	Globals.showActionPopup.connect(showActionPopup)
	
func showActionPopup (text : String) -> void:
	self.visible = true
	match text:
		"pow":
			$TextureRect.visible = true
			$TextureRect2.visible = false
		"death":
			$TextureRect.visible = false
			$TextureRect2.visible = true
