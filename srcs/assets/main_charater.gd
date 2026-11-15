extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export_range(0.0, 1.0, 0.1) var bounce_modifier := 0.5

@export var bounce_drag := 400.0

var direction := Vector2.ZERO


func apply_bounce(bounce_vec: Vector2) -> void:
	velocity.y = bounce_vec.y
	direction.x = bounce_vec.x

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta


	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var input_direction := Input.get_axis("left", "right")
	var player_vel_x := 0.0
	
	if input_direction:
		
		if not is_equal_approx(direction.x, 0.0):
			player_vel_x = input_direction * SPEED * bounce_modifier
		else:
			player_vel_x = input_direction * SPEED
	else:
		player_vel_x = 0.0

	
	velocity.x = player_vel_x + direction.x


	direction.x = move_toward(direction.x, 0.0, bounce_drag * delta)
	
	
	if is_on_floor() and velocity.y >= 0:
		direction.x = 0.0

	move_and_slide()
