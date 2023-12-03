extends Area2D

signal hit
signal goal

var velocity = Vector2(200, 200)
var screen_size
var random = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	# Establecer la posición inicial en el centro de la pantalla
	position.x = screen_size.x / 2
	position.y = screen_size.y / 2
	random.randomize()
	if random.randi_range(0,1)==1: #Returns a pseudo-random 32-bit signed integer between from and to (inclusive).
		velocity.x = -velocity.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta

func _on_ball_area_entered(area):
	hit.emit()
	if area.is_in_group("players"):
		velocity.x = -velocity.x

func _on_area_exited(area):
	if position.x > get_viewport_rect().size.x:
		goal.emit(2)
	elif position.x <= 0:
		goal.emit(1)
	elif area.is_in_group("walls"):
		velocity.y = -velocity.y

func _respawn():
	position.x = screen_size.x / 2
	position.y = screen_size.y / 2
