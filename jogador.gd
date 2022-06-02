extends Area2D

export var speed = 400 # velocidade de movimentação
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2() # vetor zerado
	
	if Input.is_action_pressed("ui_right"): # se entrada é a tecla pressionada (direita)
		velocity.x += 1 # vetor velocity aumenta 1 no eixo x
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		
	if velocity.length() > 0: # verifica se houve movimennto (velocity != 0)
		velocity = velocity.normalized() * speed # aplica a velocidade (nonrmalizada para todas as direções) no movimento
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	position += velocity * delta # exporta a posição
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
