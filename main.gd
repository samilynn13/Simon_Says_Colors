extends Node

func game_over():
	$HUD.show_game_over()

func new_game():
	$HUD.show_message("Get Ready")
	$HUD.create_color_buttons()


func _on_hud_start_game() -> void:
	pass # Replace with function body.
