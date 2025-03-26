extends CharacterBody2D


@export var speed = 300.0
@export var jumpVelocty = 400.0
@export var doubleJumpVelocity = 400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var canDoubleJump : bool = true
var direction: float
var hasJumped : bool = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if !hasJumped:
			saveJump()
	else:
		canDoubleJump = true

	# Handle jump.
	jump()
	doubleJump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction =  Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
		animated_sprite_2d.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	updateAnimation()

func updateAnimation():
	if direction == 0:
		animated_sprite_2d.play("idle") 
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
		
	if direction < 0:
		animated_sprite_2d.flip_h = true 
	
func jump()-> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		print("jump")
		velocity.y += -jumpVelocty
		animated_sprite_2d.play("jump")
		hasJumped = true

func saveJump()-> void:
	if Input.is_action_just_pressed("jump"):
		if canDoubleJump:
			print("save Jump")
			velocity.y = -doubleJumpVelocity
			canDoubleJump = false

func doubleJump()-> void:
	if Input.is_action_just_pressed("jump") and !is_on_floor() and hasJumped:
		if canDoubleJump:
			print("double jump")
			velocity.y = -doubleJumpVelocity
			canDoubleJump = false
