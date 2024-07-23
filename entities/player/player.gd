extends CharacterBody2D

const SPEED = 180.0
const JUMP_VELOCITY = -400.0
const gravity := 800
const maxFall := 300

var motion := Vector2.ZERO
var avalibleJump := true
var coyoteTime := true

@onready var sprite := $Sprite2D
@onready var coyoteTimer := $coyoteTimer

enum move {
	IDLE,
	WALK,
	JUMP
}
enum attack {
	STANDING,
	SHOOT,
	SLADE
}

var currentMove : move = move.IDLE
var currentAttack : attack = attack.STANDING

func _physics_process(delta):
			
	if not is_on_floor():
		var forceDown = gravity
		if velocity.y > 0: 
			forceDown *= 1.5
		
		velocity.y += forceDown * delta
		if velocity.y > maxFall: velocity.y = maxFall
	
	if Input.is_action_just_pressed("ui_accept") and avalibleJump:
		velocity.y = JUMP_VELOCITY
		avalibleJump = false
	
	if Input.is_action_just_released("ui_accept"):
		velocity.y /= 2
	
	coyoteProcess()
	
	if motion:
		sprite.flip_h = motion.x < 0
		_accelerate()
	else:
		_addFriction()
	
	move_and_slide()

func _input(_event):
	motion.x = Input.get_axis("ui_left", "ui_right")

func coyoteProcess():
	if is_on_floor():
		avalibleJump = true
		coyoteTime = true
		
	elif coyoteTime:
		coyoteTimer.start()
		coyoteTime = false
	
	elif coyoteTimer.is_stopped():
		avalibleJump = false

func _accelerate():
	velocity.x = motion.x * SPEED
	
func _addFriction():
	velocity.x = move_toward(velocity.x, 0, SPEED)
