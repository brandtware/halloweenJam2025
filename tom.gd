extends CharacterBody3D

var move_vector : Vector3 = Vector3.FORWARD
var directionChangeTimer : float = 0.0
var collisionCount : int = 0

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	directionChangeTimer += delta
	var did_collide = move_and_collide(move_vector * delta)
	if (did_collide != null):
		collisionCount +=1
		if directionChangeTimer < 1000:
			# TODO say something to complain
			directionChangeTimer = 0
		match (randi() %4):
			0: 
				move_vector = Vector3.FORWARD
				#$tomMesh.rotation = Vector3.FORWARD
			1: 
				move_vector = Vector3.BACK
				#$tomMesh.rotation = Vector3.BACK
			2: 
				move_vector = Vector3.LEFT
				#$tomMesh.rotation= Vector3.LEFT
			3: 
				move_vector = Vector3.RIGHT
				#$tomMesh.rotation = Vector3.RIGHT
		
