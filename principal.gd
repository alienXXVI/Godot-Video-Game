extends Node

export (PackedScene) var Inimigo
var score

func _ready():
	randomize()
	novo_jogo()

func game_over():
	$pontuacaoTimer.stop()
	$inimigoTimer.stop()
	
func novo_jogo():
	score = 0
	#$jogador.start($posicaoInicial.position) #inicia na posição do nó posicaoInincial
	$inicioTimer.start()


func _on_inicioTimer_timeout(): # qnd termina de contar os 2 s
	$inimigoTimer.start()
	$pontuacaoTimer.start()


func _on_pontuacaoTimer_timeout(): # qnd termina de contar o 1 s
	score += 1


func _on_inimigoTimer_timeout():
	$caminhoInimigo/spawnInimigo.offset = randi()
	var inimigo = Inimigo.instance()
	add_child(inimigo)
	var direcao = $caminhoInimigo/spawnInimigo.rotation + PI/2
	inimigo.position = $caminhoInimigo/spawnInimigo.position # posição da var inimigo = 4 cantos da tela
	direcao += rand_range(-PI/4, PI/4)
	inimigo.rotation = direcao
	# inimigo varia no Ox entre min e max
	inimigo.linear_velocity = Vector2(rand_range(inimigo.min_speed, inimigo.max_speed), 0)
	inimigo.linear_velocity = inimigo.linear_velocity.rotated(direcao)
