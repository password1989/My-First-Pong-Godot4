extends RigidBody2D

var speed = 200
var player = "player2"

func _physics_process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed(player+"_up"):
		direction.y -= 1
	if Input.is_action_pressed(player+"_down"):
		direction.y += 1
	move_and_collide(direction.normalized() * speed * delta)
