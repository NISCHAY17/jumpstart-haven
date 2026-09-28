extends Node2D

@export var speed := 200.0
@export var background_width := 1152.0

func _process(delta):
	$Bg1.position.x -= speed * delta
	$Bg2.position.x -= speed * delta

	if $Bg1.position.x <= -background_width:
		$Bg1.position.x = $Bg2.position.x + background_width

	if $Bg2.position.x <= -background_width:
		$Bg2.position.x = $Bg1.position.x + background_width
