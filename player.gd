extends CharacterBody2D

const SPEED = 150.0
@export var gun : Marker2D
@export var muzzle : Marker2D
@export var Bullet : PackedScene
@export var wolrd : Node

func _physics_process(_delta):

	#if Input.is_action_just_pressed("ui_up"):
		#gun.call_deferred("shoot")
	var move_direction = Vector2(Input.get_axis("move_left", "move_right"),Input.get_axis("move_up", "move_down")).normalized()
	var shot_direction = Vector2(Input.get_axis("shot_left", "shot_right"),Input.get_axis("shot_up", "shot_down")).normalized()
	
	if move_direction:
		velocity = (move_direction * SPEED)
	else:
		velocity = velocity.move_toward(Vector2.ZERO,SPEED)
	move_and_slide()
	
	if shot_direction:
		gun.rotation = shot_direction.angle()
		print(shot_direction.angle())
		pass
	
	if Input.is_action_just_pressed("shoot"):
		print(shot_direction)
		shoot()

func shoot():
	var b = Bullet.instantiate()
	b.position = muzzle.global_position
	b.rotation = gun.rotation
	wolrd.add_child(b)
