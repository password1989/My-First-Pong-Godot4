extends RigidBody2D

var velocity = Vector2(100, 100)

func _process(delta):
	move_and_collide(velocity*delta)
