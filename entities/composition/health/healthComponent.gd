extends Node2D

class_name HealthComponent

@export var maxHealth : float = 100

var health: float

signal death

# Called when the node enters the scene tree for the first time.
func _ready():
	health = maxHealth

func damage(attack : Attack):
	health -= attack.damage
	
	if health <= 0:
		death.emit()
