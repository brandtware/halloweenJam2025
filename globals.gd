extends Node

var activeTv : Node3D

# event-bus
signal move (direction : Vector3)
signal toggleCam ()

# enums
enum movement { STOP, MOVE, LEFT, RIGHT }
