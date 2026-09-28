extends CharacterBody2D

@export var jump_force: float = 720.0
@export var fall_gravity: float = 2100.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_dead: bool = false


func _physics_process(delta):
	# DEAD = NO MORE PLAYER CONTROL
	if is_dead:
		return

	# GRAVITY
	if not is_on_floor():
		velocity.y += fall_gravity * delta
	else:
		velocity.y = 0

	# JUMP
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

	velocity.x = 0

	move_and_slide()

	# ANIMATION
	if not is_on_floor():
		animated_sprite.play("jump")
	else:
		animated_sprite.play("run")


func die():
	if is_dead:
		return

	is_dead = true

	velocity = Vector2.ZERO

	animated_sprite.play("die")
