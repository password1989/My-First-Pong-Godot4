extends CanvasLayer

# Notifies `Main` node that the button has been pressed
#signal start_game
signal goal

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over!")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	get_tree().paused = true
	$EndGameMenu.show()
	
func show_game_paused():
	print("show_game_paused()")
	$EndGameMenu.get_node("CancelButton").visible = true
	$EndGameMenu.show()

func update_score_p1(score):
	$ScoreLabelP1.text = str(score)

func update_score_p2(score):
	$ScoreLabelP2.text = str(score)

func _on_restart_button_pressed():
	get_tree().change_scene_to_file("res://Pong.tscn")
	get_tree().paused = false
	
func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
	get_tree().paused = false

func _on_message_timer_timeout():
	$Message.hide()

func _on_cancel_button_pressed():
	$EndGameMenu.get_node("CancelButton").visible = false
	$EndGameMenu.hide()
	get_tree().paused = false
