extends CharacterBody2D

const SPEED = 300.0

@onready var gun = $Gun
#@export var bullet_man:BulletPool

func _ready():
	#gun.bullet_man = bullet_man
	pass

func _physics_process(_delta):

	if Input.is_action_just_pressed("ui_up"):
		gun.call_deferred("shoot")

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
