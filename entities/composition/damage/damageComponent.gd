extends Area2D

class_name DamageComponent

var attack := Attack.new()

@export var damage := 0:
	get:
		return damage
	set(value):
		damage = value
		attack.damage = value
@export var multiply : float = 1:
	get:
		return multiply
	set(value):
		multiply = value
		attack.multiply = value

func _ready():
	connect("area_entered", _on_area_entered)

func _on_area_entered(area):
	if area as HitboxCompoment:
		area.damage(attack)
		
