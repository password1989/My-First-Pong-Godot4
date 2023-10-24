extends Area2D

signal hit

var velocity = Vector2(100, 100)
#var aceleration = 50
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#velocity += Vector2(1, 1).normalized() * aceleration * delta
	position += velocity * delta

func _on_ball_area_entered(area):
	hit.emit()
	if area.is_in_group("players"):
		velocity.x = -velocity.x
		print("Jugador")

func _on_area_exited(area):
	if position.x > get_viewport_rect().size.x or position.x <= 0:
		print("Goooool")
	elif area.is_in_group("walls"):
		velocity.y = -velocity.y
		print("Muro")
