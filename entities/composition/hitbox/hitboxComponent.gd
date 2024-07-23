extends Area2D

class_name HitboxCompoment

@export var Health : HealthComponent

func damage(attack : Attack):
	if Health:
		Health.damage(attack)
		
