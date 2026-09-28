extends Node2D

@export var background_speed: float = 300.0

@onready var bg1: Sprite2D = $Newbg
@onready var bg2: Sprite2D = $Newbg2

@onready var time_label: Label = $UI/TimeLabel
@onready var spawn_timer: Timer = $ObstacleSpawner/Timer

var time_spent: float = 0.0
var game_running: bool = true

var bg_width: float


func _ready():

	bg_width = bg1.texture.get_width() * bg1.scale.x

	# Put second background EXACTLY after first
	bg2.global_position.x = bg1.global_position.x + bg_width

	# Force same vertical position
	bg2.global_position.y = bg1.global_position.y


func _process(delta):
	if not game_running:
		return


	# TIMER

	time_spent += delta
	time_label.text = "%.1f s" % time_spent

	
	var move_amount = background_speed * delta

	bg1.global_position.x -= move_amount
	bg2.global_position.x -= move_amount

	


	# its right edge = position + half width

	if bg1.global_position.x + bg_width / 2.0 < 0:
		bg1.global_position.x = bg2.global_position.x + bg_width

	if bg2.global_position.x + bg_width / 2.0 < 0:
		bg2.global_position.x = bg1.global_position.x + bg_width


func game_over():
	if not game_running:
		return

	game_running = false

	spawn_timer.stop()

	$Daven.die()

	print("GAME OVER")
	print("Survived: %.1f seconds" % time_spent)
