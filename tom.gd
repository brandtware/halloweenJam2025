extends CharacterBody3D

var move_vector : Vector3 = Vector3.LEFT
var directionChangeTimer : float = 0.0
var collisionCount : int = 0
var isMoving : bool = false

func _ready() -> void:
	Globals.move.connect(move)
	
func move (direction: Globals.movement):
	#last_direction = move_vector
	#move_vector = direction
	print ("move: ", move_vector, " -> ", Globals.movement.keys()[direction])
	match direction:
		Globals.movement.LEFT:
			$".".rotate_y(deg_to_rad(-90))
			move_vector = move_vector.rotated(Vector3(0.0,1.0,0.0), deg_to_rad(-90))
		Globals.movement.RIGHT:
			$".".rotate_y(deg_to_rad(90))
			move_vector = move_vector.rotated(Vector3(0.0,1.0,0.0), deg_to_rad(90))
		Globals.movement.STOP:
			isMoving = false
		Globals.movement.MOVE:
			isMoving = true
		
	directionChangeTimer = 0.0
	print ("direction", move_vector)
	
	
func _process(delta: float) -> void:
	directionChangeTimer += delta
	if (isMoving):
		var did_collide = move_and_collide(move_vector * delta)
		if (did_collide != null):
			collisionCount +=1
			print ("direction before collision ", move_vector)
			isMoving = false
			if directionChangeTimer < 1000:
				# TODO say something to complain
				print ("ouch")
			directionChangeTimer = 0
		
