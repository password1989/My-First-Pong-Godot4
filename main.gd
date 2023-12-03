extends Node2D

var scorep1=0
var scorep2=0

func _process(_delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		_pause()


func _pause():
	get_tree().paused = true
	$HUD.show_game_paused()
	
func _on_hud_start_game():
	$HUD.update_score_p1(scorep1)
	$HUD.update_score_p2(scorep2)

func _on_ball_goal(player):
	if player == 1:
		scorep2=scorep2+1
		$HUD.update_score_p2(scorep2)
	else:
		scorep1=scorep1+1
		$HUD.update_score_p1(scorep1)
	if scorep1 == 3 or scorep2 == 3:
		#Game_Over
		$HUD.show_game_over()

	else:
		$HUD.show_message("Goooool!")
		await get_tree().create_timer(2.0).timeout
		$Ball._respawn()
