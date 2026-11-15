extends AnimatedSprite2D


@export var bounce_velocity := Vector2(-1000.0, -600.0)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body is Player:
		return
	
	play("activate")
	body.apply_bounce(bounce_velocity)
	
	
