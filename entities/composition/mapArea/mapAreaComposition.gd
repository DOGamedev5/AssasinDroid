extends Area2D

class_name RoomArea



@export var cameraLimits : Vector2i
@export var proxRoom : String


func _ready():
	var nextRoom := load(proxRoom)
	get_parent().add_child(nextRoom.instance())
	connect("body_entered", enteredArea)
	connect("body_exited", exitedArea)

func enteredArea(body):
	pass
	if body.is_in_group("player"):
		pass

func exitedArea(body):
	pass
#	if body.is_in_group("player"):
#		havePlayer = false
#		var playerLocal
#
#		for room in parent.proxRooms:
#			if room.area.havePlayer: 
#				playerLocal = room.area
#				break
#
#		for room in parent.proxRooms:
#			if room == null or playerLocal == null:
#				continue
#
#			if room.area.havePlayer or room in playerLocal.proxRoom:
#				continue
#
#
#			room.set_process(false)
