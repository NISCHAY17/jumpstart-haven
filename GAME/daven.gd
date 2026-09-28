extends CharacterBody2D

const GRAVITY := 1500.0 #base gravity

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	move_and_slide()

	animated_sprite.play("run")
