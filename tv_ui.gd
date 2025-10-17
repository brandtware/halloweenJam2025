extends Control

var isMoving : bool = false

func _on_move_button_down() -> void:
	var direction : Vector3
	if isMoving:
		$VBoxContainer/move.text = "move"
		isMoving = false
		Globals.move.emit(Globals.movement.STOP)
	else:
		$VBoxContainer/move.text = "halt"
		isMoving = true
		Globals.move.emit(Globals.movement.MOVE)
	

func _on_left_button_down() -> void:
	Globals.move.emit(Globals.movement.LEFT)

func _on_right_button_down() -> void:
	Globals.move.emit(Globals.movement.RIGHT)


func _on_switch_button_down() -> void:
	if is_instance_valid(Globals.activeTv):
		Globals.activeTv.toggle()
