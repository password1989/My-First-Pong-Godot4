extends Node2D

var scorep1=0
var scorep2=0

func _on_hud_start_game():
	$HUD.update_score_p1(scorep1)
	$HUD.update_score_p2(scorep2)
	$HUD.show_message("Get Ready")

func _on_ball_goal(player):
	if player == 1:
		scorep1=scorep1+1
		$HUD.update_score_p1(scorep1)
	else:
		scorep2=scorep2+1
		$HUD.update_score_p1(scorep2)
	$HUD.show_message("Goooool!")
