extends Control

func _on_jugar_pressed():
	#Para cambiar de escena, esto vendria bien para un menu:
	get_tree().change_scene_to_file("res://Pong.tscn")


func _on_salir_pressed():
	#Para salir del juego: get_tree().quit()
	get_tree().quit()
