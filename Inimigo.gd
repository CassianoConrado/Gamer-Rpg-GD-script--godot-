extends KinematicBody2D

var speed = 125 
var xp = 20
var dano = 20
var tataque = 1.0
var dataque = 100
var dpers = 400 
onready var timer = $Timer
onready var alvo = get_node("/root/Main/Player")

func _ready():
	timer.wait_time = tataque
	timer.start() 

func _physics_process(delta):
	var dist = position.distance_to(alvo.position)
	if dist > dataque and  dist < dpers:
		var vel = (alvo.position - position).normalized()
		move_and_slide(vel*speed)
	


func _on_Timer_timeout():
	if position.distance_to(alvo.position) <= dataque:
		alvo.toma_dano(dano)
	
func morre():
	alvo.toma_xp(xp)
	queue_free()
