extends Node

# event-bus
signal move (direction : Vector3)
signal toggleCam ()

enum movement { STOP, MOVE, LEFT, RIGHT }
