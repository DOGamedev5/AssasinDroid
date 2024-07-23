extends Node

class_name StateManager

@export var currentState : State
@export var object : Node
var states : Array[State]

func init():
	object = get_parent()
	for child in get_children():
		if child as State:
			states.append(child)
			child.object = object
		else:
			push_warning("Child \"{}\" is not a State for \"{}\"" % child.name, name)
