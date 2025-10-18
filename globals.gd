extends Node

var activeTv : Node3D

# event-bus
signal move (direction : Vector3)
signal toggleCam ()
signal playerCollided (collisionObject : Node3D)
signal showActionPopup (type : String)

# enums
enum movement { STOP, MOVE, LEFT, RIGHT }
