extends CharacterBody2D

@export var speed: float = 350.0
@export var fall_gravity: float = 1800.0

@onready var sprite: Sprite2D = $Sprite2D

var hit_player: bool = false


func _ready():
	# Random log / rock / mushroom
	sprite.frame = randi_range(0, 2)


func _physics_process(delta):
	velocity.x = -speed

	# GRAVITY
	if not is_on_floor():
		velocity.y += fall_gravity * delta
	else:
		velocity.y = 0

	move_and_slide()

	# CHECK EVERYTHING WE COLLIDED WITH
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

		if collider != null and collider.name == "Daven":
			hit_daven()

	# DELETE OFFSCREEN
	if global_position.x < -300:
		queue_free()


func hit_daven():
	if hit_player:
		return

	hit_player = true

	get_tree().current_scene.game_over()
