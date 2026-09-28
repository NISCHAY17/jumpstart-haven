extends Control


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://GAME/main.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://GAME/main.tscn")
