extends Area2D

signal hit
signal goal

var velocity = Vector2(200, 200)
var aceleration = 50
var screen_size
var random = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	random.randomize()
	#print(random)
	print("Inicial:")
	print(velocity)
	if random.randi_range(0,1)==1: #Returns a pseudo-random 32-bit signed integer between from and to (inclusive).
		velocity.x = -velocity.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity += Vector2(1000, 1000).normalized() * delta * aceleration
	#print(velocity)
	position += velocity * delta
	#print(delta)
	print(velocity)

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
	position = Vector2(500,300)
	#queue_free()
	# Eliminar esta que ha traspasado limites 
	# crear una nueva en la posicion (500,300)
	# Que se mueva
