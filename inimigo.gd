extends RigidBody2D

# velocidade do inimigo varia de 150 a 300
export var min_speed = 150
export var max_speed = 300

func _ready():
	# verifica o nome e os frames das animações
	var tipo_inimigos = $AnimatedSprite.frames.get_animation_names()
	# escolhe uma das 3 animações
	$AnimatedSprite.animation = tipo_inimigos[randi() % tipo_inimigos.size()]


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
