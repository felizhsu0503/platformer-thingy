extends AnimatedSprite2D

# 可在右側 Inspector 面板直接調整每個彈簧的彈射力道
# X 軸負數為向左、正數為向右；Y 軸負數為向上
@export var bounce_velocity := Vector2(-600.0, -600.0)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body is Player:
		return
	
	play("activate")
	body.apply_bounce(bounce_velocity)
\
	
	
