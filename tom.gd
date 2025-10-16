extends CharacterBody3D

var move_vector : Vector3 = Vector3.ZERO
var last_direction : Vector3 = Vector3.FORWARD
var directionChangeTimer : float = 0.0
var collisionCount : int = 0

func _ready() -> void:
	Globals.move.connect(move)
	
func move (direction: Globals.movement):
	#last_direction = move_vector
	#move_vector = direction
	print (Globals.movement.keys()[direction])
	match direction:
		Globals.movement.LEFT:
			$".".rotate_y(deg_to_rad(-90))
			move_vector = move_vector.rotated(Vector3(0.0,1.0,0.0), deg_to_rad(-90))
		Globals.movement.RIGHT:
			$".".rotate_y(deg_to_rad(90))
			move_vector = move_vector.rotated(Vector3(0.0,1.0,0.0), deg_to_rad(90))
		Globals.movement.STOP:
			last_direction = move_vector
			move_vector = Vector3.ZERO
		Globals.movement.MOVE:
			move_vector = last_direction
			
	directionChangeTimer = 0.0
	print ("direction", move_vector)
	print ("last direction", last_direction)
	
	
func _process(delta: float) -> void:
	directionChangeTimer += delta
	var did_collide = move_and_collide(move_vector * delta)
	if (did_collide != null):
		collisionCount +=1
		print ("direction before collision ", move_vector)
		last_direction = move_vector
		move_vector = Vector3.ZERO
		if directionChangeTimer < 1000:
			# TODO say something to complain
			print ("ouch")
			directionChangeTimer = 0
		
