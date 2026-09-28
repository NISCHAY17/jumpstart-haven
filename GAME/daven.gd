extends CharacterBody2D

@export var jump_force: float = 650.0
@export var fall_gravity: float = 1800.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta):
	# GRAVITY
	if not is_on_floor():
		velocity.y += fall_gravity * delta
	else:
		velocity.y = 0

	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

	# Daven does NOT move 
	velocity.x = 0

	move_and_slide()

	# ANIMATION
	if not is_on_floor():
		animated_sprite.play("jump")
	else:
		animated_sprite.play("run")
