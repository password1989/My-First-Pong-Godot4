extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over!")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = "Get ready!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$RestartButton.show()

func update_score_p1(score):
	$ScoreLabelP1.text = str(score)
	
func update_score_p2(score):
	$ScoreLabelP2.text = str(score)


func _on_restart_button_pressed():
	$RestartButton.hide()
	start_game.emit()


func _on_message_timer_timeout():
	$Message.hide()
