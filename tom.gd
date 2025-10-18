extends CharacterBody3D

var move_vector : Vector3 = Vector3.LEFT
var directionChangeTimer : float = 0.0
var waitTimer : float = 0.0
var collisionCount : int = 0
var isMoving : bool = false
var speed = 1.3
var complaints = ["Ouch", "Ow", "Ack", "Argh", "Crap", "Really?","SUE!"]
var extCompaints = ["Are you kidding me?","Are you doing this on purpose?", "You think this is funny?"]
var waiting = ["What are you waiting for, christmas?", "Are you still there?", "What now?", "Where to?", "It's really creepy here", "I hear a noise..."] 
var punchable = false

func _ready() -> void:
	Globals.move.connect(move)
	Globals.restart.connect(restart)
	
func restart ():
	move_vector = Vector3.LEFT
	collisionCount = 0
	directionChangeTimer = 0
	isMoving = false
	punchable = false
	
func move (direction: Globals.movement):
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
			waitTimer = 0.0
			isMoving = false
		Globals.movement.MOVE:
			isMoving = true
	print ("direction", move_vector)
	
	
func _process(delta: float) -> void:
	directionChangeTimer += delta
	if (!isMoving):
		waitTimer += delta
		if waitTimer > 10:
			waitTimer = 0
			%ChatBubble.call_deferred("showBubble",waiting.pick_random(), 2)
	var did_collide = move_and_collide(move_vector * delta * speed, !isMoving)
	if (did_collide != null):
		var col = did_collide.get_collider(0)
		if (col is Mummy || isMoving):
			Globals.playerCollided.emit(col)
		if (col is StaticBody3D && isMoving):
			get_tree().call_group("mummies","alert")
			collisionCount +=1
			print ("direction before collision ", move_vector)
			isMoving = false
			if directionChangeTimer > 5:
				%ChatBubble.call_deferred("showBubble",complaints.pick_random(), 2)
			else:
				%ChatBubble.call_deferred("showBubble",extCompaints.pick_random(), 2)
			directionChangeTimer = 0
		elif col is CharacterBody3D: # Mummy-Time
			isMoving = false
			if punchable:
				%ChatBubble.call_deferred("showBubble", "take this mummy!", 2)
				Globals.mummyCollision.emit("pow")
			else:
				%ChatBubble.call_deferred("showBubble", "aaaaahhh, I touched something", 2)
				Globals.mummyCollision.emit("death")
				Globals.gameOver.emit()

func isReadyToPunch (isReady : bool) -> void:
	punchable = isReady
	
