extends AnimatedSprite2D
@export var jump_height := 500

func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body is Player:
		return
	
	play("activate")
	body.velocity = Vector2.ONE.rotated(rotation)
