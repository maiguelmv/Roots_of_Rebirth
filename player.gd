extends CharacterBody2D

class_name Player

@export var speed = 150
@export var life = 100
@export var attack = 15
var current_dir = "none"

func _ready():
	NavigationManage.on_trigger_player_spawn.connect(_on_spawn)
	$AnimatedSprite2D.play("front_idle")
	
func _on_spawn (positione : Vector2, direction: String):
	global_position = positione
	$AnimatedSprite2D.play(direction+"_idle")

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed("right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	
	elif Input.is_action_pressed("left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	
	elif Input.is_action_pressed("down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	
	elif Input.is_action_pressed("up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
	

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("right_walk")
		elif movement == 0:
			anim.play("right_idle")
	if dir == "left":
		anim.flip_h = false
		if movement == 1:
			anim.play("left_walk")
		elif movement == 0:
			anim.play("left_idle")
			
	
	if dir == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")
	if dir == "down":
		anim.flip_h = true
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			anim.play("front_idle")
	
	
