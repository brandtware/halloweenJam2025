extends Control

func _ready() -> void:
	Globals.mummyCollision.connect(showActionPopup)
	
func showActionPopup (text : String) -> void:
	self.visible = true
	match text:
		"pow":
			$TextureRect.visible = true
			$TextureRect2.visible = false
		"death":
			$TextureRect.visible = false
			$TextureRect2.visible = true
		_:
			$TextureRect.visible = false
			$TextureRect2.visible = false
			self.visible = false


func _on_restart_button_down() -> void:
	Globals.restart.emit()


func _on_quit_button_down() -> void:
	get_tree().quit()
