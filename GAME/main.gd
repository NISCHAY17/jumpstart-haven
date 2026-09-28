extends Node2D

@export var speed: float = 200.0
@export var background_width: float = 1152.0

@onready var bg1: Sprite2D = $Bg1
@onready var bg2: Sprite2D = $Bg2
@onready var time_label: Label = $UI/TimeLabel

var time_spent: float = 0.0
var game_running: bool = true


func _process(delta):
	# MOVE BACKGROUND
	bg1.position.x -= speed * delta
	bg2.position.x -= speed * delta

	# LOOP BACKGROUND
	if bg1.position.x <= -background_width:
		bg1.position.x = bg2.position.x + background_width

	if bg2.position.x <= -background_width:
		bg2.position.x = bg1.position.x + background_width

	# COUNT SURVIVAL TIME
	if game_running:
		time_spent += delta
		update_time()


func update_time():
	time_label.text = "%.1f s" % time_spent
