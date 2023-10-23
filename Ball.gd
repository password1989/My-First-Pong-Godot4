extends RigidBody2D

var velocity = Vector2(100, 0)

func _process(delta):
	move_and_collide(velocity*delta)


func _on_body_entered(body):
	if body.is_in_group("walls"):
		velocity.x = -velocity.x
		print("Colisión con los muros detectada")
	if body.is_in_group("players"):
		velocity.x = -velocity.x
		print("Colisión con los jugadores detectada")
