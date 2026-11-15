extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# 彈起時按方向鍵的操控靈敏度（0.1 = 微調，1.0 = 完整速度疊加）
@export_range(0.0, 1.0, 0.1) var bounce_modifier := 0.5
# 彈簧推力在空中的衰減速度（數字越小飛越遠）
@export var bounce_drag := 400.0

var direction := Vector2.ZERO

# 供彈簧或其他機關呼叫的彈射函式
func apply_bounce(bounce_vec: Vector2) -> void:
	velocity.y = bounce_vec.y
	direction.x = bounce_vec.x

func _physics_process(delta: float) -> void:
	# 1. 重力處理
	if not is_on_floor():
		velocity += get_gravity() * delta

	# 2. 跳躍處理
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# 3. 計算玩家按鍵產生的速度
	var input_direction := Input.get_axis("left", "right")
	var player_vel_x := 0.0
	
	if input_direction:
		# 如果還在彈射狀態 (direction.x 不為 0)，按鍵速度乘上靈敏度
		if not is_equal_approx(direction.x, 0.0):
			player_vel_x = input_direction * SPEED * bounce_modifier
		else:
			player_vel_x = input_direction * SPEED
	else:
		player_vel_x = 0.0

	# 4. 將「玩家按鍵速度」與「彈簧推力」相加（不再覆蓋）
	velocity.x = player_vel_x + direction.x

	# 5. 讓彈簧水平推力隨時間慢慢衰減
	direction.x = move_toward(direction.x, 0.0, bounce_drag * delta)
	
	# 落地後清空殘留推力，避免在地上繼續滑行
	if is_on_floor() and velocity.y >= 0:
		direction.x = 0.0

	move_and_slide()
