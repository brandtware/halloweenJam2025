extends CharacterBody3D

var move_vector : Vector3 = Vector3.LEFT
var directionChangeTimer : float = 0.0
var collisionCount : int = 0
var isMoving : bool = false
var speed = 1.3
var complaints = ["Ouch", "Ow", "Ack", "Argh", "Crap", "Really?","SUE!"]
var extCompaints = ["Are you kidding me?","Are you doing this on purpose?", "You think this is funny?"]
var waiting = ["What are you waiting for, christmas?", "Are you still there?", "What now?", "Where to?", "It's really creepy here", "I hear a noise..."] 

func _ready() -> void:
	Globals.move.connect(move)
	
func move (direction: Globals.movement):
	#last_direction = move_vector
	#move_vector = direction
	print ("move: ", move_vector, " -> ", Globals.movement.keys()[direction])
	match direction:
		Globals.movement.LEFT:
			$".".rotate_y(deg_to_rad(90))
			move_vector = move_vector.rotated(Vector3(0.0,1.0,0.0), deg_to_rad(90))
			directionChangeTimer = 0.0
		Globals.movement.RIGHT:
			$".".rotate_y(deg_to_rad(-90))
			move_vector = move_vector.rotated(Vector3(0.0,1.0,0.0), deg_to_rad(-90))
			directionChangeTimer = 0.0
		Globals.movement.STOP:
			isMoving = false
		Globals.movement.MOVE:
			isMoving = true
	print ("direction", move_vector)
	
	
func _process(delta: float) -> void:
	directionChangeTimer += delta
	if (isMoving):
		var did_collide = move_and_collide(move_vector * delta * speed)
		if (did_collide != null):
			Globals.playerCollided.emit(did_collide.get_collider(0))
			get_tree().call_group("mummies","alert")
			collisionCount +=1
			print ("direction before collision ", move_vector)
			isMoving = false
			if directionChangeTimer < 1000:
				%ChatBubble.call_deferred("showBubble",complaints.pick_random(), 2)
			else:
				%ChatBubble.call_deferred("showBubble",extCompaints.pick_random(), 2)
			
				
			directionChangeTimer = 0
