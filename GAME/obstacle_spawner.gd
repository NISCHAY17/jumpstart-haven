extends Node2D

@export var obstacle_scene: PackedScene

# Difficulty settings
@export var starting_min_gap: float = 1.8
@export var starting_max_gap: float = 3.0

@export var minimum_min_gap: float = 0.8
@export var minimum_max_gap: float = 1.4

@export var difficulty_rate: float = 0.025

@onready var timer: Timer = $Timer

var game_time: float = 0.0


func _ready():
	randomize()
	set_next_spawn()


func _process(delta):
	# Track how long the player has survived
	game_time += delta


func _on_timer_timeout():
	spawn_obstacle()
	set_next_spawn()


func spawn_obstacle():
	var obstacle = obstacle_scene.instantiate()
	obstacle.global_position = global_position

	get_tree().current_scene.add_child(obstacle)


func set_next_spawn():
	# Difficulty goes from 0 → 1 over time
	var difficulty = clamp(game_time * difficulty_rate, 0.0, 1.0)

	# Gradually reduce the random spawn gap
	var current_min_gap = lerp(
		starting_min_gap,
		minimum_min_gap,
		difficulty
	)

	var current_max_gap = lerp(
		starting_max_gap,
		minimum_max_gap,
		difficulty
	)

	timer.wait_time = randf_range(current_min_gap, current_max_gap)
	timer.start()
