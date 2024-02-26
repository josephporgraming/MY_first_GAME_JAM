extends CharacterBody2D


@export var velocity_slowdown = 0
@export var SPEED = 300.0
@export var jump_velocity = 30
@export var max_speed = 5000
# Get the gravity from the project settings to be synced with RigidBody nodes.
@export var gravity = 200
var direction = 0
func negitve_or_potive(input_number):
	if input_number > 0:
		return 1
	if input_number < 0:
		return -1
	else:
		return 0
"""
func decleration():
	if direction == 0 and velocity.x != 0:
		if velocity.x > 0 and not velocity.x < 0:
			velocity.x -= velocity_slowdown
		elif velocity.x < 0 and not velocity.x > 0:
			velocity.x += velocity_slowdown
		elif velocity.x > -10 or velocity.x < 10:
			velocity.x = 0
"""
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > 10000:
			velocity.y = 10000
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x += (direction * SPEED)
		if velocity.x >= max_speed:
			velocity.x =max_speed
		if velocity.x <= -max_speed:
			velocity.x  = -max_speed
	else:
		if velocity.x >= 0:
			velocity.x -= velocity_slowdown
		if velocity.x <= 0:
			velocity.x += velocity_slowdown
		if((velocity.x <= 100 ) or (velocity.x >= -100)):
			velocity.x = 0
		
	
	""""if direction:
		velocity.x += direction * SPEE
		if(velocity.x > max_player_horisontal_speed ):
			velocity.x = max_player_horisontal_speed
		elif(velocity.x < -max_player_horisontal_speed):
			velocity.x = -max_player_horisontal_speed"""
	print(velocity.x)

	move_and_slide()
