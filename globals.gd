extends Node

var activeTv : Node3D

# event-bus
signal move (direction : Vector3)
signal toggleCam ()
signal playerCollided (collisionObject : Node3D)
signal mummyCollision (type : String)
signal gameOver()
signal restart()

# enums
enum movement { STOP, MOVE, LEFT, RIGHT }
