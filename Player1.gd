extends Area2D

var screen_size
var speed = 200
var player = "player1"

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed(player+"_up"):
		direction.y -= 1
	if Input.is_action_pressed(player+"_down"):
		direction.y += 1
	if direction.length() > 0:
		direction = direction.normalized() * speed
	position += direction * delta
	position = position.clamp(Vector2.ZERO, screen_size)
