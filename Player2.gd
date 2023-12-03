extends Area2D

var screen_size
var speed = 200
var player = "player2"

func _ready():
	screen_size = get_viewport_rect().size
	# Establecer la posición inicial en el centro de la pantalla
	position.x = screen_size.x-50
	position.y = screen_size.y / 2

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


func _on_touch_panel_gui_input(event):
	if event is InputEventScreenDrag:
		position.y += event.relative.y
