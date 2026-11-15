extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export_range(0.0, 1.0, 0.1) var bounce_modifier := 0.1
var direction :Vector2
func apply_velocity(added_vec:Vector2):
	velocity += added_vec

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_direction := Input.get_axis("left", "right")
	if input_direction:
		if not is_equal_approx(direction.x, 0):
			velocity.x = input_direction * SPEED * bounce_modifier
		else:
			velocity.x = input_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.x += lerp(direction.x, 0.0, 0.8)
	direction.x -= lerp(direction.x, 0.0, 0.8)
	move_and_slide()
