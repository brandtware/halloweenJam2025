extends Node3D
class_name Level1

var isGameOver : bool = false

func _ready() -> void:
	%Mummy.visible = false
	#Globals.gameOver.connect(gameOver)
	Globals.mummyCollision.connect(mummyCollision)
	Globals.restart.connect(restart)

func _process(delta: float) -> void:
	if !isGameOver:
		$Path3D/PathFollow3D.progress_ratio += 0.05 * delta

func activate(active : bool) -> void:
	%Mummy.visible = active
	%Tom.visible = active
	
func mummyCollision(text) -> void:
	if text == "pow":
		var tween = create_tween()
		await tween.tween_interval(1).finished
		
		%Mummy.reparent($Furniture/Sarg/Sargopharg)
		%Mummy.position = Vector3(0.9, 0.1, -0.04)
		%Mummy.rotation = Vector3(1.570796, -1.570796, 0.0)
		%Mummy.scale = Vector3 (0.4, 0.4, 0.4)
		Globals.mummyCollision.emit("")
		tween = create_tween()
		await tween.tween_property(%Deckel, "rotation", Vector3 (-1.570796, 0, 0), 1).finished
		%Mummy.visible = false
		%Tom.showWaitComments = false
		Dialogic.start("1_complete")
	elif text == "death":
		isGameOver = true
	
func restart() -> void:
	%Tom.position = Vector3 (3.289, 0, 3.479)
	%Tom.rotation = Vector3 (0.0, -1.570796, 0.0)
	$Path3D/PathFollow3D.progress_ratio = 0
	Globals.mummyCollision.emit("")
	isGameOver = false

func _on_punch_area_body_entered(body: Node3D) -> void:
	print (body)
	if (body is Mummy):
		%Tom.isReadyToPunch(true)

func _on_punch_area_body_exited(body: Node3D) -> void:
	print (body)
	if (body is Mummy):
		%Tom.isReadyToPunch(false)
