extends CharacterBody2D

@export var speed: float = 350.0
@export var fall_gravity: float = 1800.0

@onready var sprite: Sprite2D = $Sprite2D


func _ready():
	# Randomly choose:
	# 0 = log
	# 1 = rock
	# 2 = mushrooms
	sprite.frame = randi_range(0, 2)


func _physics_process(delta):
	# Move obstacle left
	velocity.x = -speed

	# Gravity
	if not is_on_floor():
		velocity.y += fall_gravity * delta
	else:
		velocity.y = 0

	# Handle ground collision
	move_and_slide()

	# Delete once far off-screen
	if global_position.x < -300:
		queue_free()
